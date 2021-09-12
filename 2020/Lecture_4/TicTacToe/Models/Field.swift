//
//  Field.swift
//  TicTacToe
//
//  Created by Emil Nielsen on 16/09/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import Foundation

struct Field {

    var property = Token.empty

    private var fieldNumber: Int

    private static var fieldNumberFactory = 0

    init() {
        self.fieldNumber = Field.getUniqueFieldNumber()
    }

    private static func getUniqueFieldNumber() -> Int {
        fieldNumberFactory += 1
        return fieldNumberFactory
    }

}

enum Token {
    case empty, cross, circle
}

