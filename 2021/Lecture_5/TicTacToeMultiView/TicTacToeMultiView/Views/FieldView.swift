//
//  FieldView.swift
//  TicTacToeMultiView
//
//  Created by Benjamin Staugaard on 07/10/2021.
//

import SwiftUI

struct FieldView: View {
    
    let cross = #imageLiteral(resourceName: "cross")
    let nought = #imageLiteral(resourceName: "nought")
    
    @ObservedObject var boardViewModel: BoardViewModel
    var index: Int
    
    var body: some View {
        Button(action: {
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

struct FieldView_Previews: PreviewProvider {
    static var previews: some View {
        FieldView(boardViewModel: BoardViewModel(), index: 0)
    }
}
