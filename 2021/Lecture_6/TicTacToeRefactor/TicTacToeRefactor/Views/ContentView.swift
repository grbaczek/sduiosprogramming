//
//  ContentView.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var boardViewModel = BoardViewModel()
    @State var appeared = false
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()
            BoardView(boardViewModel: boardViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
