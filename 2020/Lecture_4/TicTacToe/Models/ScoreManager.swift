//
//  ScoreManager.swift
//  TicTacToe
//
//  Created by Emil Nielsen on 16/09/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import Foundation

class ScoreManager {

    private(set) var scores = ["Cross": 0, "Circle": 0, "Draw": 0]

    public func registerScore(for result: String) {
        if let score = scores[result] {
            scores[result] = score + 1
        }
    }

}

