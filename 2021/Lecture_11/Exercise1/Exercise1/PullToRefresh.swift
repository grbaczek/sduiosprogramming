//
//  PullToRefresh.swift
//  Exercise1
//
//  Created by Grzegorz Baczek on 28/11/2021.
//

import Foundation
import SwiftUI
import UIKit

struct PullToRefreshView<Content: View>: UIViewRepresentable {
    private var width: CGFloat
    private var height: CGFloat
    private let content: () -> Content
    private let refresh: () -> Void
    private let isLoading: Bool

    init(_ width: CGFloat, _ height: CGFloat, isLoading: Bool, refresh: @escaping () -> Void, @ViewBuilder contentBuilder: @escaping () -> Content) {
        self.width = width
        self.height = height
        self.content = contentBuilder
        self.refresh = refresh
        self.isLoading = isLoading
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(refresh)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
            #selector(Coordinator.handleRefreshControl),
            for: .valueChanged)
        let childView = UIHostingController(rootView: content())
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        childView.view.backgroundColor = .clear
        control.addSubview(childView.view)
        context.coordinator.uiHostingController = childView
        return control
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        if !isLoading {
            uiView.refreshControl?.endRefreshing()
        }
        context.coordinator.uiHostingController?.rootView = content()
    }

    class Coordinator: NSObject {
        let refresh: () -> Void
        var uiHostingController: UIHostingController<Content>?
        init(_ refresh: @escaping () -> Void) {
            self.refresh = refresh
        }

        @objc func handleRefreshControl(sender: UIRefreshControl) {
            refresh()
        }
    }
}

