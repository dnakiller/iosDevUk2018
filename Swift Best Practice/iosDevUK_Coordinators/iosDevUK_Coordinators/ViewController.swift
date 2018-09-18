//
//  ViewController.swift
//  iosDevUK_Coordinators
//
//  Created by Gabbo on 03/09/2018.
//  Copyright © 2018 GabboInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyAction(_ sender: UIButton) {
        coordinator?.buy()
    }
    @IBAction func createAccount(_ sender: UIButton) {
        coordinator?.createAccount()
    }
    
}

