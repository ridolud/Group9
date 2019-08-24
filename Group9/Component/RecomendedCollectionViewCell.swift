//
//  recomendedCollectionViewCell.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class RecomendedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var transparentBackground: UIView!
    @IBOutlet weak var recommendedImage: UIImageView!
    @IBOutlet weak var recommendedTitle: UILabel!
    @IBOutlet weak var recommendedDescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var spot:Spot! {
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        recommendedTitle.text = spot.title
        recommendedImage.image = spot.image
        recommendedDescription.text = spot.description
    }

}
