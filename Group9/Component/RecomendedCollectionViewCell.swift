//
//  recomendedCollectionViewCell.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class RecomendedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gradientBackground: UIView!
    @IBOutlet weak var recommendedImage: UIImageView!
    @IBOutlet weak var recommendedTitle: UILabel!
    @IBOutlet weak var recommendedDescription: UILabel!
    
    var currentPlace : Place!
    var isDummy = false
    var isLoading = false {
        didSet{
            if self.isLoading {
                self.recommendedTitle.alpha = 0
                self.recommendedDescription.alpha = 0
                self.gradientBackground.alpha = 0
            }else{
                self.recommendedTitle.alpha = 1
                self.recommendedDescription.alpha = 1
                self.gradientBackground.alpha = 0.42
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientBackground?.layer.cornerRadius = 10.0
        gradientBackground?.layer.masksToBounds = true
        
        recommendedImage?.layer.cornerRadius = 10.0
        recommendedImage?.layer.masksToBounds = true
        
        [recommendedTitle .sizeToFit()]
        [recommendedDescription .sizeToFit()]
    

    }
    
    func loadPlace(place: Place){
        self.currentPlace = place
        recommendedTitle.text = currentPlace?.name
        if isDummy {
            recommendedImage.setDummyImage(place.category)
        }else {
            recommendedImage.loadFromUrl(currentPlace?.featureImgUrl)
        }
        let distance = Int(((LocationManager.instance.currentLocation?.distance(from: currentPlace.location!))!))
    recommendedDescription.text = "\(distance/1000) km, \(currentPlace.kota)"
        
        
    }
    
    
}
