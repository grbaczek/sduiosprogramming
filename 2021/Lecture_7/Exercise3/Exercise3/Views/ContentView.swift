//
//  ContentView.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var boardViewModel = BoardViewModel()
    @State var countdownX = false
    @State var countdownY = false
    
    var body: some View {
        ZStack {
            if !boardViewModel.boardModel.gameOver{
                if boardViewModel.boardModel.currentPlayer == player.X {
                    TimerShape(timeLeftPercent: countdownX ? 0 : 1,
                               timeElapsed:{
                        boardViewModel.timeElapsed()
                    }).fill(.orange)
                        .opacity(0.2)
                        .onAppear{
                            withAnimation(.linear(duration: 3)){
                                countdownX = true
                                countdownY = false
                            }
                        }
                } else {
                    TimerShape(timeLeftPercent: countdownY ? 0 : 1,
                               timeElapsed:{
                        boardViewModel.timeElapsed()
                    }).fill(.orange)
                        .opacity(0.2)
                        .onAppear{
                            withAnimation(.linear(duration: 3)){
                                countdownX = false
                                countdownY = true
                            }
                        }
                }
            }
            BoardView(boardViewModel: boardViewModel, countdownX: $countdownX, countdownY: $countdownY)
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
