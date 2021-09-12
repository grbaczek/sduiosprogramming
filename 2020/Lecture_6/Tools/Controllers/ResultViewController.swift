//
//  ResultViewController.swift
//  Tools
//
//  Created by Emil Nielsen on 03/10/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var type: String!
    var perimeter: Double!
    var area: Double!

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var perimeterLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!

    override func viewDidLoad() {
        typeLabel.text = type
        perimeterLabel.text = "Perimeter: \(String(perimeter))"
        areaLabel.text = "Area: \(String(area))"
    }

}
