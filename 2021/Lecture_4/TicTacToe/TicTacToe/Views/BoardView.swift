//
//  BoardView.swift
//  TicTacToe
//
//  Created by Benjamin Staugaard on 21/09/2021.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                FieldView(index:0)
                FieldView(index:1)
                FieldView(index:2)
                Spacer()
            }
            HStack {
                Spacer()
                FieldView(index:3)
                FieldView(index:4)
                FieldView(index:5)
                Spacer()
            }
            HStack {
                Spacer()
                FieldView(index:6)
                FieldView(index:7)
                FieldView(index:8)
                Spacer()
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
