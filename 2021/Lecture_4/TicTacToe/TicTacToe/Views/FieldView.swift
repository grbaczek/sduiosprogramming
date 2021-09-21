//
//  FieldView.swift
//  TicTacToe
//
//  Created by Benjamin Staugaard on 21/09/2021.
//

import SwiftUI

struct FieldView: View {
    
    @EnvironmentObject var boardViewModel: BoardViewModel
    let cross = #imageLiteral(resourceName: "cross")
    let nought = #imageLiteral(resourceName: "nought")
    
    var index: Int
    
    var body: some View {
        Button(action: {
            boardViewModel.setField(index: index)
        }) {
            let state = self.boardViewModel.boardModel[self.index] ?? .empty
            Image(uiImage: state == .empty ? UIImage() : state == .cross ? cross : nought)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(state == .cross ? .red : .blue)
                .frame(width: 90, height: 90)
        }
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
}

struct FieldView_Previews: PreviewProvider {
    static let boardViewModel = BoardViewModel()
    static var previews: some View {
        FieldView(index: 0)
            .environmentObject(boardViewModel)
    }
}
