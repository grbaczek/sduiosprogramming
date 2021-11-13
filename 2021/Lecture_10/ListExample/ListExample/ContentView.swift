//
//  ContentView.swift
//  ListExample
//
//  Created by Grzegorz Baczek on 12/11/2021.
//

import SwiftUI

struct ContentView: View {
    struct City: Identifiable {
        let name: String
        let id = UUID()
    }
    private var capitals = [
        City(name: "Tirana"),
        City(name: "Andorra la Vella"),
        City(name: "Yerevan"),
        City(name: "Vienna"),
        City(name: "Baku"),
        City(name: "Minsk"),
        City(name: "Yerevan"),
        City(name: "Vienna"),
        City(name: "Zagreb"),
        City(name: "Nicosia"),
        City(name: "Prague"),
        City(name: "Copenhagen"),
        City(name: "Tallinn"),
        City(name: "Helsinki"),
        City(name: "Valletta"),
        City(name: "Chisinau"),
        City(name: "Monaco"),
        City(name: "Podgorica"),
        City(name: "Amsterdam"),
        City(name: "Rome"),
        City(name: "Dublin"),
        City(name: "Reykjavik"),
        City(name: "Stockholm"),
        City(name: "Madrid"),
        City(name: "Bratislava"),
        City(name: "San Marino"),
        City(name: "Moscow"),
        City(name: "Bucharest"),
        City(name: "Lisbon"),
        City(name: "Warsaw"),
        City(name: "Oslo"),
        City(name: "Berlin")
    ]

    var body: some View {
        List(capitals) { item in
            Text(item.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
