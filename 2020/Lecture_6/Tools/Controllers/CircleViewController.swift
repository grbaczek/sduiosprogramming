//
//  TextViewController.swift
//  Tools
//
//  Created by Emil Nielsen on 03/10/2020.
//  Copyright © 2020 Emil Nielsen. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController {

    private var circle: Circle?

    @IBOutlet weak var radius: UITextField!

    override func prepare(for segue:
        UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ResultViewController {
            vc.type = "Circle"
            vc.area = circle?.area()
            vc.perimeter = circle?.perimeter()
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let r = Double(radius.text!) {
            circle = Circle(radius: r)
            return true
        }
        return false
    }

}
