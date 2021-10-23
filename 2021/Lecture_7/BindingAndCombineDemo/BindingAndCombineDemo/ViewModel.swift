//
//  ViewModel.swift
//  BindingAndCombineDemo
//
//  Created by Grzegorz Baczek on 23/10/2021.
//

import Foundation
import Combine
import CoreText

class ViewModel: ObservableObject{
    @Published var firstToggle = false
    @Published var secondToggle = false
    @Published var description = ""
    var cancellable: AnyCancellable? = nil
    
    init(){
        cancellable = Publishers
            .CombineLatest($firstToggle, $secondToggle)
            .sink(receiveValue: { [weak self] firstToggleValue, secondToggleValue in
                self?.description = "First toggle: \(firstToggleValue), Second toggle: \(secondToggleValue)"
            })
    }
    
    deinit{
        cancellable?.cancel()
    }
}
