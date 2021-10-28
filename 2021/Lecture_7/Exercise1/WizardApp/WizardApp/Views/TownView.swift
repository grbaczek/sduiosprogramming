//
//  TownView.swift
//  WizardApp
//
//  Created by Benjamin Staugaard on 28/10/2021.
//

import SwiftUI

struct TownView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Town")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
            Spacer()
            TextField("Enter your current town", text: $userViewModel.userModel.town)
                .multilineTextAlignment(.center)
                .frame(height: 50)
                .border(.secondary)
                .padding()
            Spacer()
            NavigationLink(destination: ResultView(userViewModel: userViewModel)) {
                Text("Next")
            }
            .frame(width: 200, height: 50, alignment: .center)
        }
    }
}

struct TownView_Previews: PreviewProvider {
    static var previews: some View {
        TownView(userViewModel: UserViewModel())
    }
}
