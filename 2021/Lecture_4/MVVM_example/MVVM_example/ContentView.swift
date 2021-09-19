//
//  ContentView.swift
//  MVVM_example
//
//  Created by Grzegorz Baczek on 19/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var colorViewModel = ColorViewModel()
    
    var body: some View {
        ZStack{
            switch(colorViewModel.colorModel.currentColor){
            case .red:
                Color.red
            case .green:
                Color.green
            case .orange:
                Color.orange
            case .yellow:
                Color.yellow
            }
            Button(action: {
                colorViewModel.updateCurrentColor()
            }) {
                Text("Change background color")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
