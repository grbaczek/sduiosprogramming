//
//  ScrollViewController.swift
//  Product Browser
//
//  Created by Emil Nielsen on 18/10/2020.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController {
    
    var productDescription: String!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        productDescriptionLabel.text = productDescription
    }
}
