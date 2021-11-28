//
//  ContentView.swift
//  UserDefaultsDemo
//
//  Created by Grzegorz Baczek on 06/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var button1TapCount = UserDefaults.standard.integer(forKey: "Button1TapCount")
    
    @AppStorage("Button2TapCount") private var button2TapCount = 0
    
    var body: some View {
        VStack{
            Text("Button 1 tapped: \(button1TapCount)")
                .padding()
            Text("Button 2 tapped: \(button2TapCount)")
            Button(action: {
                button1TapCount += 1
                UserDefaults.standard.set(button1TapCount, forKey: "Button1TapCount")
            }, label: {
                Text("Button 1")
            }).padding()
            Button(action: {
                button2TapCount += 1
            }, label: {
                Text("Button 2")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
