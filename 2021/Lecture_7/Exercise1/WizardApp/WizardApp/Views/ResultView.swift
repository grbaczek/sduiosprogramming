//
//  ResultView.swift
//  WizardApp
//
//  Created by Benjamin Staugaard on 28/10/2021.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Result")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
            Spacer()
            VStack {
                Text("First name: \(userViewModel.userModel.firstName)")
                    .padding()
                Text("Last name: \(userViewModel.userModel.lastName)")
                    .padding()
                Text("Town name: \(userViewModel.userModel.town)")
                    .padding()
            }
            Spacer()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(userViewModel: UserViewModel())
    }
}
