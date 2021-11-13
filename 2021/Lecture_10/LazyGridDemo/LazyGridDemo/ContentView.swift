//
//  ContentView.swift
//  LazyGridDemo
//
//  Created by Grzegorz Baczek on 13/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    var columns: [GridItem] =
    Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        ScrollView {
             LazyVGrid(columns: columns) {
                 ForEach((0...1000), id: \.self) {
                     let codepoint = $0 + 0x1f600
                     let emoji = String(Character(UnicodeScalar(codepoint)!))
                     Text("\(emoji)")
                 }
             }.font(.largeTitle)
         }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
