//
//  ContentView.swift
//  Exercise1
//
//  Created by Grzegorz Baczek on 31/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var chuckNorrisJokesViewModel = ChuckNorrisJokesViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            if chuckNorrisJokesViewModel.downloadingJoke{
                ProgressView()
            }else{
                Text("\(chuckNorrisJokesViewModel.currentJoke)")
                    .padding()
            }
            Spacer()
            Button(action: {
                chuckNorrisJokesViewModel.getCurrentJoke()
            }, label: {
                Text("Get next joke")
            }).disabled(chuckNorrisJokesViewModel.downloadingJoke)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
