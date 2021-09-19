//
//  ColorViewModel.swift
//  MVVM_example
//
//  Created by Grzegorz Baczek on 19/09/2021.
//

import Foundation

class ColorViewModel: ObservableObject {
    @Published var colorModel = ColorModel()
    
    func updateCurrentColor() {
        colorModel.updateCurrentColor()
    }
}
