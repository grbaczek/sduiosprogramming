//
//  ContentView.swift
//  Wizard App Core Data
//
//  Created by Benjamin Staugaard on 12/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("First name")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Spacer()
                TextField("Enter your first name", text: Binding($userViewModel.userModel.firstName)!)
                    .onDisappear {
                        try? self.managedObjectContext.save()
                    }
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .border(.secondary)
                    .padding()
                Spacer()
                NavigationLink(destination: LastNameView(userViewModel: userViewModel)) {
                    Text("Next")
                }
                .frame(width: 200, height: 50, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
