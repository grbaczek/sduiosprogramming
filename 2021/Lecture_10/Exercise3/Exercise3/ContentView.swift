//
//  ContentView.swift
//  Exercise3
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
                ScrollView{
                    LazyVStack{
                        ForEach(chuckNorrisJokesViewModel.chuckNorrisJokes, id: \.self){joke in
                            Text(joke)
                        }
                    }
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
