//
//  ViewController.swift
//  Scroll Image
//
//  Created by serfusE on 17/10/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var steveImage: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return steveImage
    }


}

