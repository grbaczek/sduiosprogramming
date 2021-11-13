//
//  LastNameView.swift
//  Wizard App Core Data
//
//  Created by Benjamin Staugaard on 12/11/2021.
//


import SwiftUI

struct LastNameView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Last name")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
            Spacer()
            TextField("Enter your last name", text: Binding($userViewModel.userModel.lastName)!)
                .onDisappear {
                    try? self.managedObjectContext.save()
                }
                .multilineTextAlignment(.center)
                .frame(height: 50)
                .border(.secondary)
                .padding()
            Spacer()
            NavigationLink(destination: TownView(userViewModel: userViewModel)) {
                Text("Next")
            }
            .frame(width: 200, height: 50, alignment: .center)
        }
    }
}

struct LastNameView_Previews: PreviewProvider {
    static var previews: some View {
        LastNameView(userViewModel: UserViewModel())
    }
}
