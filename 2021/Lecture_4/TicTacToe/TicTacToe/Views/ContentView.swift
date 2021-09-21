//
//  ContentView.swift
//  TicTacToe
//
//  Created by Benjamin Staugaard on 21/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var boardViewModel = BoardViewModel()
    
    let cross = #imageLiteral(resourceName: "cross")
    let nought = #imageLiteral(resourceName: "nought")
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()
            ZStack {
                Image("board")
                    .resizable()
                    .frame(width: 300, height: 300)
                VStack {
                    HStack {
                        Spacer()
                        getFieldButton(index:0)
                        getFieldButton(index:1)
                        getFieldButton(index:2)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        getFieldButton(index:3)
                        getFieldButton(index:4)
                        getFieldButton(index:5)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        getFieldButton(index:6)
                        getFieldButton(index:7)
                        getFieldButton(index:8)
                        Spacer()
                    }
                }
            }
            .alert(isPresented: $boardViewModel.gameOver) {
                Alert(title: Text(boardViewModel.gameOverText!), dismissButton: Alert.Button.destructive(Text("Play Again"), action:  boardViewModel.reset) )
            }
        }
    }
    
    fileprivate func getFieldButton(index: Int) -> some View {
        return Button(action: {
            boardViewModel.setField(index: index)
        }) {
            let state = self.boardViewModel.boardModel[index] ?? .empty
            Image(uiImage: state == .empty ? UIImage() : state == .cross ? cross : nought)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(state == .cross ? .red : .blue)
                .frame(width: 90, height: 90)
        }
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static let boardViewModel = BoardViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(boardViewModel)
    }
}
