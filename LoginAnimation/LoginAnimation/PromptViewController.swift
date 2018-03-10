//
//  PromptViewController.swift
//  LoginAnimation
//
//  Created by serfusE on 28/10/2017.
//  Copyright © 2017 serfusE. All rights reserved.
//

import Foundation
import UIKit

class PromptViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 5
        logInButton.layer.cornerRadius = 5
    }
    
}
