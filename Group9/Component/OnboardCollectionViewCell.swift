//
//  OnboardCollectionViewCell.swift
//  onboardingTest
//
//  Created by Azis Jabbar Susetio on 03/09/19.
//  Copyright © 2019 Azis Susetio. All rights reserved.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        [subTitle .sizeToFit()]
        [title .sizeToFit()]
        
        
    }
    
    var onboard:Onboard!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI() {
        title.text = onboard.title
        img.image = onboard.img
        subTitle.text =  onboard.subTitle
    }

}
