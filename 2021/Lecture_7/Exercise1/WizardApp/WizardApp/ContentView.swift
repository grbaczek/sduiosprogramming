//
//  ContentView.swift
//  WizardApp
//
//  Created by Benjamin Staugaard on 28/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("First name")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Spacer()
                TextField("Enter your first name", text: $userViewModel.userModel.firstName)
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
