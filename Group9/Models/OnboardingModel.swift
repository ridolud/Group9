//
//  OnboardingModel.swift
//  Group9
//
//  Created by Willa on 28/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import Foundation

struct OnboardingModel {
    
    var imageName: String?
    var descText: String?
    
   
    func fetchData() -> [OnboardingModel] {
        return [
            OnboardingModel(imageName: "onboarding-1", descText: "Do you realize what happens to the plastic you throw away?"),
            OnboardingModel(imageName: "onboarding-2", descText: "When plastic is burned in the open air, it releases large amounts of toxins, which pollutes the air. If the toxins are inhaled for a long time period of time, it can lead to respiratory problems."),
            OnboardingModel(imageName: "onboarding-3", descText: "You can contribute in preventing from this situation by implementing zero waste lifestyle!"),
            OnboardingModel(imageName: "onboarding-4", descText: "Zero waste lifestyle is a set of principles focused on waste prevention that encourages the redesign of resource life cycles so that all products are reused. The goal is for no trash to be sent to landfills, incinerators, or the ocean."),
            OnboardingModel(imageName: "onboarding-5", descText: "In wastly you can find any kind of store, repair services and drinking refill spot near you to support your zero waste lifestyle."),
        ]
    }
}
