//
//  ContentView.swift
//  TransitionDemo
//
//  Created by Grzegorz Baczek on 17/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var explicitAnimationViewModel = ExplicitAnimationViewModel()
    var body: some View {
        ZStack{
            if explicitAnimationViewModel.firstViewShown {
                Text("Hello, world!")
                    .padding()
                    .transition(.move(edge: .trailing))
            } else{
                Text("Hello, world!")
                    .foregroundColor(.orange)
                    .padding()
            }
            VStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration: 3)){
                        //changes to state
                        explicitAnimationViewModel.firstViewShown = !explicitAnimationViewModel.firstViewShown
                    }
                }, label: {
                    Text("Transition demo")
                        .padding()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
