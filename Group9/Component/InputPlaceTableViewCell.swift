//
//  InputPlaceTableViewCell.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 29/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class InputPlaceTableViewCell: UITableViewCell {
    
    var inputPlaceDelegate:InputPlaceTableViewCellDelegate?

    @IBOutlet weak var inputButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        inputButton.layer.cornerRadius = inputButton.frame.height * 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
}
    
    @IBAction func inputPlace(_ sender: Any) {
        self.inputPlaceDelegate?.didPressedInputPressedButton(url: "https://airtable.com/shrLNuTBDOeqVjf62")
        print("https://airtable.com/shrLNuTBDOeqVjf62")
    }
    
    
}

@objc protocol InputPlaceTableViewCellDelegate {
    @objc func didPressedInputPressedButton(url: String)
}
