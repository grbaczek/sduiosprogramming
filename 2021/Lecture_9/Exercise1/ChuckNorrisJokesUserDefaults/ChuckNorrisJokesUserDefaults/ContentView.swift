//
//  ContentView.swift
//  ChuckNorrisJokesUserDefaults
//
//  Created by Benjamin Staugaard on 12/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var chuckNorrisJokesViewModel = ChuckNorrisJokesViewModel()
    @AppStorage("ViewedJokes") private var viewedJokes = 0
    
    var body: some View {
        VStack{
            Text("Viewed Jokes: \(viewedJokes)")
                .padding()
            Spacer()
            if chuckNorrisJokesViewModel.downloadingJoke {
                ProgressView()
                    .padding()
            } else {
                Text("\(chuckNorrisJokesViewModel.currentJoke)")
                    .padding()
            }
            Spacer()
            Button(action: {
                chuckNorrisJokesViewModel.getCurrentJoke()
                viewedJokes += 1
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
