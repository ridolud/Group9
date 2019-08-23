//
//  StoreListTableViewCell.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 23/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class StoreListTableViewCell: UITableViewCell {

    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeAddress: UILabel!
    @IBOutlet weak var storeTime: UILabel!
    @IBOutlet weak var storeRatingAverage: UILabel!
    @IBOutlet weak var storeRatingTotal: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        storeImage.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
