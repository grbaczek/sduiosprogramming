//
//  Model.swift
//  MVVM_example
//
//  Created by Grzegorz Baczek on 19/09/2021.
//

import Foundation

enum AvailableColors: Int, CaseIterable {
    case red = 0
    case green
    case orange
    case yellow
}

struct ColorModel {
    
    var currentColor: AvailableColors = .red
    private var counter: Int = 0
    
    mutating func updateCurrentColor(){
        counter += 1
        let colourIndex = counter % AvailableColors.allCases.count
        currentColor = AvailableColors(rawValue: colourIndex)!
    }
}
