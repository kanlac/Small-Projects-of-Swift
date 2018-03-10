//
//  ViewController.swift
//  AnimateTable
//
//  Created by serfusE on 31/10/2017.
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
    
    
    @IBOutlet weak var viewOutlet: UIView!

    @IBAction func buttonPressed(_ sender: Any) {
        viewOutlet.transform = CGAffineTransform(translationX: 20, y: 50)
    }
    @IBAction func secButtonPressed(_ sender: Any) {
        viewOutlet.transform = CGAffineTransform(translationX: -20, y: -50)
    }

}

