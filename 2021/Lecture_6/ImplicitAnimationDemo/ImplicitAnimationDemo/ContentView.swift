//
//  ContentView.swift
//  AnimationDemo
//
//  Created by Grzegorz Baczek on 16/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var
        animationDemoViewModel = ImplicitAnimationDemoViewModel()
    
    var body: some View {
        ZStack{
            Text("Hello, world!")
                .rotationEffect(animationDemoViewModel.rotate ? .degrees(360) : .degrees(0))
                .scaleEffect(animationDemoViewModel.large ? 2.0 : 1.0)
                .animation(.linear)
                .padding()
            VStack{
                Spacer()
                Button(action: {
                    animationDemoViewModel.large = !animationDemoViewModel.large
                    animationDemoViewModel.rotate = !animationDemoViewModel.rotate
                }, label: {
                    Text("Trigger implicit animation")
                }).padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
