//
//  BoardViewModel.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import SwiftUI

class BoardViewModel: ObservableObject {
    
    @Published var boardModel = BoardModel()
    
    func setField(index: Int) {
        boardModel.setField(index: index)
    }
    
    func reset() {
        boardModel.reset()
    }
    
    func isInWinningCondition(fieldIndex: Int) -> Bool{
        return boardModel.isInWinningCondition(fieldIndex: fieldIndex)
    }
    func isInLoosingCondition(fieldIndex: Int) -> Bool{
        return boardModel.isInLoosingCondition(fieldIndex: fieldIndex)
    }
}
