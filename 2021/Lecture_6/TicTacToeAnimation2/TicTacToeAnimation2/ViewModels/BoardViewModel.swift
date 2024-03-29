//
//  BoardViewModel.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import SwiftUI

class BoardViewModel: ObservableObject {
    
    @Published var boardModel = BoardModel()
    @Published var countdownX = false
    @Published var countdownY = false
    
    func setField(index: Int) {
        boardModel.setField(index: index)
    }
    
    func reset() {
        boardModel.reset()
        countdownX = false
        countdownY = false
    }
    
    func timeElapsed(){
        DispatchQueue.main.async { [weak self] in
            self?.countdownX = false
            self?.countdownY = false
            self?.boardModel.timeElapsed()
        }
    }
}
