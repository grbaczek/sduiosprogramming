//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Benjamin Staugaard on 21/09/2021.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    
    @StateObject var boardViewModel = BoardViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(boardViewModel)
        }
    }
}
