//
//  InterestCell.swift
//  Carousel Effect
//
//  Created by serfusE on 12/10/2017.
//  Copyright © 2017 null. All rights reserved.
//

import Foundation
import UIKit

class InterestCell: UICollectionViewCell {
    
    @IBOutlet weak var interestImage: UIImageView!
    @IBOutlet weak var interestLabel: UILabel!
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        interestImage.image = interest.featuredImage
        interestLabel.text = interest.title
    }
    
}
