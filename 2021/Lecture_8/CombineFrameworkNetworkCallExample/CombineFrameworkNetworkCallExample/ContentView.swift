//
//  ContentView.swift
//  CombineFrameworkNetworkCallExample
//
//  Created by Grzegorz Baczek on 31/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var combineFrameworkNetworkCallExampleViewModel = CombineFrameworkNetworkCallExampleViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            Text("Current time: \(combineFrameworkNetworkCallExampleViewModel.currentTime)")
                .font(.body)
                .padding()
            Spacer()
            Button(action: {
                combineFrameworkNetworkCallExampleViewModel.getCurrentTime()
            }, label: {
                Text("Get current time")
            }).padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
