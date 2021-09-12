//
//  ColorViewController.swift
//  Tools
//
//  Created by Emil Nielsen on 03/10/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit

class RectangleViewController: UIViewController {

    private var rectangle: Rectangle?

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var width: UITextField!

    @IBAction func result(_ sender: UIButton) {
        if let h = Double(height.text!), let w = Double(width.text!) {
            rectangle = Rectangle(height: h, width: w)
            performSegue(withIdentifier: "DisplayRectangleResult", sender: self)
        }
    }

    override func prepare(for segue:
        UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ResultViewController {
            vc.type = "Rectangle"
            vc.area = rectangle?.area()
            vc.perimeter = rectangle?.perimeter()
        }
    }

}
