//
//  StoreCollectionCell.swift
//  Group9
//
//  Created by Faridho Luedfi on 22/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class StoreCollectionCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var hourPlace: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imagePlace.layer.cornerRadius = 12
    }

}
