//
//  ChuckNorrisJokesCoreDataApp.swift
//  ChuckNorrisJokesCoreData
//
//  Created by Benjamin Staugaard on 30/11/2021.
//

import SwiftUI

@main
struct ChuckNorrisJokesCoreDataApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
