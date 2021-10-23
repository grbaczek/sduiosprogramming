//
//  ContentView.swift
//  BindingAndCombineDemo
//
//  Created by Grzegorz Baczek on 23/10/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            Toggle("First toggle", isOn: $viewModel.firstToggle)
                .padding()
            Toggle("Second toggle", isOn: $viewModel.secondToggle)
                .padding()
            Text(viewModel.description)
                .padding()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
