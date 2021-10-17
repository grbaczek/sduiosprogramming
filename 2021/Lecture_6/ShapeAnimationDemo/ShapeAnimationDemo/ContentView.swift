//
//  ContentView.swift
//  ShapeAnimationDemo
//
//  Created by Grzegorz Baczek on 17/10/2021.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct ContentView: View {
    
    @StateObject var shapeAnimationViewModel: ShapeAnimationViewModel = ShapeAnimationViewModel()
    
    var body: some View {
        Button<ZStack>(action: {
            withAnimation(.linear(duration: 1)) {
                shapeAnimationViewModel.insetAmount = CGFloat.random(in: 10...90)
                }
        }, label: {
            ZStack{
                Trapezoid(insetAmount: shapeAnimationViewModel.insetAmount)
                    .frame(width: 200, height: 100)
            }
                       
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
