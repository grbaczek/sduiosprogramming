//
//  LastNameView.swift
//  WizardApp
//
//  Created by Benjamin Staugaard on 28/10/2021.
//

import SwiftUI

struct LastNameView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Last name")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
            Spacer()
            TextField("Enter your last name", text: $userViewModel.userModel.lastName)
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
