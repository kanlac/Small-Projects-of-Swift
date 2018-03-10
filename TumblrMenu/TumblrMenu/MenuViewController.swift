//
//  MenuViewController.swift
//  TumblrMenu
//
//  Created by serfusE on 08/11/2017.
//  Copyright © 2017 serfusE. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    let transitionManager = MenuTransitionManager()
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var audioButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var textButton: UIButton!
    
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var audioLabel: UILabel!
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = transitionManager
    }
    
    
    
}
