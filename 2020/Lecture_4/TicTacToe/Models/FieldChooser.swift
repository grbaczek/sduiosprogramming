//
//  FieldChooser.swift
//  TicTacToe
//
//  Created by Emil Nielsen on 16/09/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import Foundation

class FieldChooser {

    var fields = [Field]()
    private (set) var result: String
    private let winnerStates = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    init(numberOfFields: Int) {
        for _ in 1...numberOfFields { //countable range
            let field = Field()
            fields.append(field)
        }
        result = ""
    }

    private func checkWinner(token: Token) -> Bool {
        for combination in winnerStates {
            if (fields[combination[0]].property == token) && (fields[combination[1]].property == token) && fields[combination[2]].property == token {
                return true
            }
        }
        return false
    }

    public func chooseField(index: Int) -> Bool {
        if fields[index].property == .empty {
            //Place the brick
            return true
        }
        return false
    }

    public func isGameOver() -> Bool {
        if checkWinner(token: .cross) {
            result = "Cross"
            return true
        }
        if checkWinner(token: .circle) {
            result = "Circle"
            return true
        }
        for field in fields {
            if field.property == .empty {
                // A field is empty, so we have no draw
                return false
            }
        }
        result = "Draw"
        return true
    }

    public func resetGameState() {
        for i in 0...fields.count - 1 {
            fields[i].property = Token.empty
        }
    }

}

