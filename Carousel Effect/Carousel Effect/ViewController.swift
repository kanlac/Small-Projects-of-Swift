//
//  ViewController.swift
//  Carousel Effect
//
//  Created by serfusE on 04/10/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: Properties
    
    var interests: [Interest] = [
        Interest(title: "Training like this, #bodyline", featuredImage: UIImage(named: "bodyLine")!),
        Interest(title: "Dark Varder, #emoji", featuredImage: UIImage(named: "darkVarder")!),
        Interest(title: "let's work out!", featuredImage: UIImage(named: "run")!)
    ]
    
    
    // MARK: Outlets
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    
    // MARK: CollectionView methods
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCell
        cell.interest = interests[indexPath.row]
        return cell
    }

}

