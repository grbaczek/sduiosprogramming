//
//  Circle.swift
//  Tools
//
//  Created by Emil Nielsen on 03/10/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import Foundation

struct Circle: MathOperations {

    var radius: Double

    public func perimeter() -> Double {
        return 2 * Double.pi * radius
    }

    public func area() -> Double {
        return Double.pi * radius * radius
    }

}
