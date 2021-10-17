//
//  ContentView.swift
//  ExplicitAnimation
//
//  Created by Grzegorz Baczek on 16/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var explicitAnimationViewModel = ExplicitAnimationViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                if explicitAnimationViewModel.firstViewShown {
                    Text("Hello, world!")
                        .padding()
                    Spacer()
                } else{
                    Spacer()
                    Text("Hello, world!")
                        .foregroundColor(.orange)
                        .padding()
                }
                Button(action: {
                    withAnimation(.easeInOut(duration: 3)){
                        //changes to state
                        explicitAnimationViewModel.firstViewShown = !explicitAnimationViewModel.firstViewShown
                    }
                }, label: {
                    Text("Explicit animation")
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
