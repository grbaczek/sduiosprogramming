//
//  ContentView.swift
//  TicTacToe
//
//  Created by Benjamin Staugaard on 21/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var boardViewModel: BoardViewModel
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()
            ZStack {
                Image("board")
                    .resizable()
                    .frame(width: 300, height: 300)
                BoardView()
            }
            .alert(isPresented: $boardViewModel.gameOver) {
                Alert(title: Text(boardViewModel.gameOverText!), dismissButton: Alert.Button.destructive(Text("Play Again"), action:  boardViewModel.reset) )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let boardViewModel = BoardViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(boardViewModel)
    }
}
