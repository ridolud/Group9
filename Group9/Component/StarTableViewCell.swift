//
//  StarTableViewCell.swift
//  Group9
//
//  Created by Ridwan Abdurrasyid on 25/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewCategoryLabel: UILabel!
    
    let starOn = "★"
    let starOff = "☆"
    var starArray = [UIButton]()
    var score = 0
    
    @IBOutlet weak var starOneOutlet: UIButton!
    @IBOutlet weak var starTwoOutlet: UIButton!
    @IBOutlet weak var starThreeOutlet: UIButton!
    @IBOutlet weak var starFourOutlet: UIButton!
    @IBOutlet weak var starFiveOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        starArray.append(starOneOutlet)
        starArray.append(starTwoOutlet)
        starArray.append(starThreeOutlet)
        starArray.append(starFourOutlet)
        starArray.append(starFiveOutlet)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func setStar(_ sender: UIButton) {
        turnStar(sender.tag)
        score = sender.tag
    }
    
    func turnStar(_ val : Int){
        let index = val - 1
        
        for star in starArray {
            star.setTitle(starOff, for: .normal)
        }
        for i in 0 ... index {
            starArray[i].setTitle(starOn, for: .normal)
        }
    }
}
