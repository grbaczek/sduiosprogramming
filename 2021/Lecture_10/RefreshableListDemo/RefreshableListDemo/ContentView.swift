//
//  ContentView.swift
//  RefreshableListDemo
//
//  Created by Grzegorz Baczek on 13/11/2021.
//

import SwiftUI

struct City: Identifiable {
    let name: String
    let id = UUID()
}

class CapitalsViewModel: ObservableObject{
    @Published var capitals = [
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
}

struct ContentView: View {
   
    @StateObject var capitalViewModel: CapitalsViewModel = CapitalsViewModel()
    

    var body: some View {
        List(capitalViewModel.capitals) { item in
            Text(item.name)
        }.refreshable {
            if capitalViewModel.capitals.count > 0{
                var indexToRemove: Int = 0
                if capitalViewModel.capitals.count > 5{
                    indexToRemove = Int.random(in: 0..<5)
                } else{
                    indexToRemove = Int.random(in: 0..<capitalViewModel.capitals.count)
                }
                withAnimation{
                    capitalViewModel.capitals.remove(at: indexToRemove)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
