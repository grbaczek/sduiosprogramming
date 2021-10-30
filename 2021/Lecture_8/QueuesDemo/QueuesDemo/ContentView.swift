//
//  ContentView.swift
//  QueuesDemo
//
//  Created by Grzegorz Baczek on 30/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var queueDemoViewModel = QueueDemoViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            Button(action: {
                queueDemoViewModel.performTimeConsumingTask()
            }, label: {
                Text("Perform Time Consuming Task")
            })
                .padding()
            Spacer()
            Text("Second button click counter: \(queueDemoViewModel.secondButtonCounter)")
                .padding()
            Button(action: {
                queueDemoViewModel.secondButtonCounter += 1
            }, label: {
                Text("Second button")
                    .padding()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
