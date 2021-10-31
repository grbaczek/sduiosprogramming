//
//  BoardViewModel.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import SwiftUI
import Combine

class BoardViewModel: ObservableObject {
    
    @Published var boardModel = BoardModel()
    @Published var countdownX = false
    @Published var countdownY = false
    let timeForMoveInSeconds: Double = 3
    var timerCancelable: Cancellable? = nil
    
    func setField(index: Int) {
        boardModel.setField(index: index)
        startTimer()
    }
    
    func reset() {
        boardModel.reset()
        countdownX = false
        countdownY = false
        startTimer()
    }
    
    func startTimer(){
        timerCancelable?.cancel()
        timerCancelable = Timer.publish(every: timeForMoveInSeconds, on: .main, in: .default)
            .autoconnect()
            .sink(
                receiveCompletion: { arg in
                },
                receiveValue: { [weak self] value in
                    self?.timerCancelable?.cancel()
                    self?.timeElapsed()
                }
            )
    }
    
    deinit{
        timerCancelable?.cancel()
    }
    
    func timeElapsed(){
        countdownX = false
        countdownY = false
        boardModel.timeElapsed()
    }
}
