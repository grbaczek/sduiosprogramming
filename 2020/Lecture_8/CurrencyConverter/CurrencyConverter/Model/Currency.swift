//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Emil Nielsen on 27/10/2020.
//

import Foundation

struct Currency: Codable {
    
    let base: String
    let rates: [String: Double]
    let date: String
    
}
