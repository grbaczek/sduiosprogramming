//
//  UserViewModel.swift
//  Wizard App Core Data
//
//  Created by Benjamin Staugaard on 12/11/2021.
//

import SwiftUI
import CoreData

class UserViewModel: ObservableObject {
    
    @Published var userModel: User
    
    init() {
        let context = PersistenceController.shared.container.viewContext
        let request = NSFetchRequest<User>(entityName: "User")
        request.fetchLimit = 1
        if let user = try? context.fetch(request).first {
            self.userModel = user
        } else {
            self.userModel = User(context: context)
            try? context.save()
        }
    }
}
