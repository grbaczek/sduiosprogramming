//
//  ContentView.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var boardViewModel = BoardViewModel()
    
    var body: some View {
        ZStack {
            
            if !boardViewModel.boardModel.gameOver{
                if boardViewModel.boardModel.currentPlayer == player.X {
                    TimerShape(timeLeftPercent: boardViewModel.countdownX ? 0 : 1).fill(.orange)
                        .opacity(0.2)
                        .onAppear{
                            withAnimation(.linear(duration: boardViewModel.timeForMoveInSeconds)){
                                boardViewModel.countdownX = true
                                boardViewModel.countdownY = false
                                boardViewModel.startTimer()
                            }
                        }
                } else {
                    TimerShape(timeLeftPercent: boardViewModel.countdownY ? 0 : 1).fill(.orange)
                        .opacity(0.2)
                        .onAppear{
                            withAnimation(.linear(duration: boardViewModel.timeForMoveInSeconds)){
                                boardViewModel.countdownX = false
                                boardViewModel.countdownY = true
                                boardViewModel.startTimer()
                            }
                        }
                }
            }
            BoardView(boardViewModel: boardViewModel)
            VStack{
                
                Text("Tic Tac Toe")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
