//
//  ContentView.swift
//  ChuckNorrisJokesCoreData
//
//  Created by Benjamin Staugaard on 30/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var chuckNorrisJokesViewModel = ChuckNorrisJokesViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            Text("Stored Jokes: \(chuckNorrisJokesViewModel.chuckNorrisJokes.count)")
                .padding()
            Spacer()
            ZStack {
                List {
                    ForEach(chuckNorrisJokesViewModel.chuckNorrisJokes, id: \.self){ joke in
                        Text(joke.joke!)
                    }.onDelete(perform: { indexSet in
                        chuckNorrisJokesViewModel.remove(at: indexSet)
                    })
                }.opacity(chuckNorrisJokesViewModel.downloadingJoke ? 0.2 : 1)
                ProgressView()
                    .scaleEffect(3)
                    .opacity(chuckNorrisJokesViewModel.downloadingJoke ? 1 : 0)
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
