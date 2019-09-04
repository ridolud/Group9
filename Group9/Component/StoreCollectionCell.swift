//
//  StoreCollectionCell.swift
//  Group9
//
//  Created by Faridho Luedfi on 22/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import MapKit

class StoreCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var hourPlace: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var place: Place!
    
    var isFavorite = false
    var isDummy = false
    var isLoading = false {
        didSet{
            if self.isLoading {
                self.loadingView.alpha = 1
                self.favoriteButton.alpha = 0
            }else{
                self.loadingView.alpha = 0
                self.favoriteButton.alpha = 1
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imagePlace.layer.cornerRadius = 12
    }
    
    func loadPlace(place: Place) {
        self.place = place
        let distance = Int((place.location?.distance(from: LocationManager.instance.currentLocation!))!)
        nameLabel.text = self.place.name
        addressLabel.text = "\(distance/1000) km - \(self.place.kecamatan), \(self.place.kota) "
        if isDummy {
            imagePlace.setDummyImage(place.category)
        }else {
            imagePlace.loadFromUrl(self.place.featureImgUrl)
        }
        hourPlace.text = self.place.openHour
    }
    
    @IBAction func favoriteAction(_ sender: Any) {
        isFavorite = !isFavorite
        if isFavorite {
            favoriteButton.setImage(UIImage(named: "Info 2"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "32px Icon Button"), for: .normal)
        }
    }
    

}
