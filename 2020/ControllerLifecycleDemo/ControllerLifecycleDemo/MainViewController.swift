//
//  ViewController.swift
//  ControllerLifecycleDemo
//
//  Created by Grzegorz Baczek on 05/10/2020.
//  Copyright © 2020 Grzegorz Baczek. All rights reserved.
//

import UIKit

class MainViewController: DemoAppViewController {
   /* @IBAction func btnClicked(_ sender: UIButton) {
        if sender.title(for: .normal) == "X" {
          sender.setTitle("A very long title for this button", for: .normal)
        } else {
          sender.setTitle("X", for: .normal)
        }
    }*/
    @IBAction func btnClicked(_ sender: UIButton) {
        if sender.title(for: .normal) == "X" {
          sender.setTitle("A very long title for this button", for: .normal)
        } else {
          sender.setTitle("X", for: .normal)
        }
    }
    
    
    override var className : String {
        get{
            return "MainViewController"
        }
        set{}
    }
}

