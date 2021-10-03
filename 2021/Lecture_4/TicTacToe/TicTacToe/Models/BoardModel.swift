//
//  BoardModel.swift
//  TicTacToe
//
//  Created by Benjamin Staugaard on 21/09/2021.
//

import Foundation

struct BoardModel {
    
    let winConditions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var board = [FieldState?](repeating: .empty, count: 9)
    
    mutating func reset() {
        board = [FieldState?](repeating: .empty, count: 9)
    }
    
    func hasWinner() -> Bool {
        return winConditions.contains{ condition in
            board[condition.first!] != .empty && condition.dropFirst().map{
                board[$0]}.allSatisfy{$0 == board[condition.first!]}
            
        }
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
