//
//  ContentView.swift
//  LazyVStackDemo
//
//  Created by Grzegorz Baczek on 13/11/2021.
//

import SwiftUI

struct ContentView: View {

    private var items = Array(0...5000)

    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(items, id: \.self){ item in
                    CustomIOSProgrammingView(txt: "Item \(item)")
                }
            }
        }
    }
}

struct CustomIOSProgrammingView: View{
    
    let txt: String
    
    var body: some View{
        VStack{
           Text(txt)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
