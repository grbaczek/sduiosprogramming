//
//  ContentView.swift
//  NetworkCallExample
//
//  Created by Grzegorz Baczek on 30/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var networkCallExampleViewModel = NetworkCallExampleViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            Text("Current time: \(networkCallExampleViewModel.currentTime)")
                .font(.body)
                .padding()
            Spacer()
            Button(action: {
                networkCallExampleViewModel.getCurrentTime()
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
