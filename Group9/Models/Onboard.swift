//
//  onboard.swift
//  onboardingTest
//
//  Created by Azis Jabbar Susetio on 03/09/19.
//  Copyright © 2019 Azis Susetio. All rights reserved.
//

import Foundation
import UIKit

struct Onboard {
    var img: UIImage
    var title: String
    var subTitle: String
    
    
    init(title:String, img:UIImage, subTitle:String) {
        self.img = img
        self.title = title
        self.subTitle = subTitle
    }
    
    static func fetchData()->[Onboard]{
        return[
            Onboard(title: "Hello! Welcome to Wastly", img: #imageLiteral(resourceName: "onboard_logo"), subTitle: "Do you realize what happens to the plastic you throw away? "),
            Onboard(title: "", img: #imageLiteral(resourceName: "onboard_fire"), subTitle: "When plastic waste is burned in the open air, it releases large amounts of toxins, which pollutes the air. If the toxins are inhaled for a long period of time, it can lead to respiratory problems. "),
            Onboard(title: "", img: #imageLiteral(resourceName: "onboard_waste"), subTitle: "You can contribute in preventing from this situation by implementing zero waste lifestyle!" ),
            Onboard(title: "", img: #imageLiteral(resourceName: "onboard_bag"), subTitle: "Zero waste lifestyle is a set of principles focused on waste prevention that encourages the redesign of resource life cycles so that all products are reused The goal is for no trash to be sent to landfills, incinerators, or the ocean."),
            Onboard(title: "", img: #imageLiteral(resourceName: "onboard_shop"), subTitle: "In wastly you can find any kind of store, repair services and drinking refill spot near you and you can also add store, repair services, drinking refill that are not. in this app to support zero waste lifestyle.")
        
        ]
    }
}
