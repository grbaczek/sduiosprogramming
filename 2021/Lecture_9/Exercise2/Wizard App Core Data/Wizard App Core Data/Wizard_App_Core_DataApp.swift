//
//  Wizard_App_Core_DataApp.swift
//  Wizard App Core Data
//
//  Created by Benjamin Staugaard on 12/11/2021.
//

import SwiftUI

@main
struct Wizard_App_Core_DataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
