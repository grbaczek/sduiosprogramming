//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Benjamin Staugaard on 21/09/2021.
//

import SwiftUI

class BoardViewModel: ObservableObject {
    
    var player = 0
    @Published var boardModel = BoardModel()
    @Published var gameOver = false
    @Published var gameOverText: String?
    
    func setField(index: Int) {
        if (boardModel[index] == .empty) {
            boardModel[index] = player == 0 ? .cross : .nought
            if (boardModel.hasWinner()) {
                gameOver = true
                gameOverText = "Player \(player == 0 ? "X" : "O") won!"
            } else if (boardModel.full()) {
                gameOver = true
                gameOverText = "Draw"
            }
            player = player == 0 ? 1 : 0
        }
    }
    
    func reset() {
        player = 0
        boardModel.reset()
    }
}
