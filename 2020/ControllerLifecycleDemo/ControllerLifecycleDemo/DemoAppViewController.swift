//
//  DemoAppViewController.swift
//  ControllerLifecycleDemo
//
//  Created by Grzegorz Baczek on 05/10/2020.
//  Copyright © 2020 Grzegorz Baczek. All rights reserved.
//

import UIKit

class DemoAppViewController: UIViewController {
    
    var className = "DemoAppViewController"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("\(className): viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("\(className): viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        print("\(className): viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        print("\(className): viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        print("\(className): viewDidDisappear")
    }
    
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        print("\(className): viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        print("\(className): viewDidLayoutSubviews")
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
