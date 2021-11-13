//
//  ContentView.swift
//  Exercise2
//
//  Created by Grzegorz Baczek on 13/11/2021.
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
                List{
                    ForEach(chuckNorrisJokesViewModel.chuckNorrisJokes, id: \.self){joke in
                        Text(joke)
                    }.onDelete(perform: { indexSet in
                        chuckNorrisJokesViewModel.remove(at: indexSet)
                    })
                }
                
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
