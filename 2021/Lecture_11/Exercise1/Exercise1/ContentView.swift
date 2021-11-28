//
//  ContentView.swift
//  Exercise2
//
//  Created by Grzegorz Baczek on 31/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var chuckNorrisJokesViewModel = ChuckNorrisJokesViewModel()
    
    var body: some View {
        
        ZStack {
            GeometryReader { reader in
                PullToRefreshView(reader.size.width, reader.size.height, isLoading: chuckNorrisJokesViewModel.downloadingJoke, refresh: {
                    chuckNorrisJokesViewModel.getCurrentJoke()
                }){
                    VStack{
                        Spacer()
                        
                        Text("\(chuckNorrisJokesViewModel.currentJoke)")
                            .padding()
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
