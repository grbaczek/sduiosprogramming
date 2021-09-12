//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Emil Nielsen on 27/10/2020.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CurrencyViewController, let text = textField.text {
            vc.currencyName = text
        }
    }

}
