//
//  CalculatorViewController.swift
//  Tools
//
//  Created by Emil Nielsen on 03/10/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit

class TriangleViewController: UIViewController {

    private var triangle: Triangle?

    @IBOutlet weak var sideA: UITextField!
    @IBOutlet weak var sideB: UITextField!
    @IBOutlet weak var sideC: UITextField!

    @IBAction func result(_ sender: UIButton) {
        if let a = Double(sideA.text!), let b = Double(sideB.text!), let c = Double(sideC.text!) {
            triangle = Triangle(sideA: a, sideB: b, sideC: c)
            performSegue(withIdentifier: "DisplayTriangleResult", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ResultViewController {
            vc.type = "Triangle"
            vc.area = triangle?.area()
            vc.perimeter = triangle?.perimeter()
        }
    }

}
