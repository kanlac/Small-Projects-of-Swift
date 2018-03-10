//
//  ViewController.swift
//  TumblrMenu
//
//  Created by serfusE on 08/11/2017.
//  Copyright © 2017 serfusE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMainController(_sender: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }


}

