//
//  BoardModel.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import Foundation

enum player{
    case X
    case O
}

struct BoardModel {
    
    var gameOver = false
    var gameOverText: String?
    var currentPlayer = player.X
    
    let winConditions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var board = [FieldState?](repeating: .empty, count: 9)
    
    mutating func reset() {
        board = [FieldState?](repeating: .empty, count: 9)
        currentPlayer = player.X
    }
    
    private func isConditionPresentOnBoard(_ condition: [Int]) -> Bool {
        return board[condition.first!] != .empty && condition.dropFirst()
            .map{board[$0]}
            .allSatisfy{$0 == board[condition.first!]}
    }
    
    func hasWinner() -> Bool {
        return winConditions.contains{ condition in
            isConditionPresentOnBoard(condition)
        }
    }
    
    mutating func setField(index: Int) {
        if (board[index] == .empty) {
            board[index] = currentPlayer == player.X ? .cross : .nought
            if (hasWinner()) {
                gameOver = true
                gameOverText = "Player \(currentPlayer == player.X ? "X" : "O") won!"
            } else if (full()) {
                gameOver = true
                gameOverText = "Draw"
            }
            changePlayer()
        }
    }
    
    func isInWinningCondition(fieldIndex: Int) -> Bool{
        let winCondition = winConditions.filter({ condition in
            isConditionPresentOnBoard(condition)
        }).first
        return winCondition?.contains(where: {i in i == fieldIndex}) ?? false
    }
    func isInLoosingCondition(fieldIndex: Int) -> Bool{
        return hasWinner() && !isInWinningCondition(fieldIndex: fieldIndex)
    }
    
    mutating func changePlayer(){
        currentPlayer = currentPlayer == player.X ? player.O : player.X
    }
    
    func full() -> Bool {
        return board.allSatisfy{$0 != .empty}
    }
    
    subscript(index: Int) -> FieldState? {
        get {
            board[index]
        }
        set {
            board[index] = newValue
        }
    }
}
