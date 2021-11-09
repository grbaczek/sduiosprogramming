//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by Grzegorz Baczek on 06/11/2021.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
