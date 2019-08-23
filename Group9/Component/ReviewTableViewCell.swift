//
//  ReviewTableViewCell.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 23/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAddressDate: UILabel!
    @IBOutlet weak var varietryReview: UILabel!
    @IBOutlet weak var priceReview: UILabel!
    @IBOutlet weak var cleanlinessReview: UILabel!
    @IBOutlet weak var zeroWasteReview: UILabel!
    @IBOutlet weak var review: UILabel!
    @IBOutlet weak var storeRating: UILabel!
    @IBOutlet weak var ratingBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func rounded(){
        userProfilePicture.layer.cornerRadius = 25
        ratingBackground.layer.cornerRadius = 6
        userAddressDate.textColor = UIColor(displayP3Red: 124, green: 157, blue: 144, alpha: 1)
    }
}
