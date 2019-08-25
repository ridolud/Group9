
//
//  article.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 23/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

struct Article {
    var title:String
    var image:UIImage
    var link:String
    
    init(title:String,image:UIImage,link:String) {
        self.title = title
        self.image = image
        self.link = link
    }
    
    static func fetchArticle() -> [Article]{
        return [
            Article(title: "101 Easy Eco Friendly Zero Waste Tips", image: UIImage(named: "img2")!, link: "https://www.goingzerowaste.com/blog/101-easy-eco-friendly-zero-waste-tips"),
            Article(title: "The Ultimate List of Zero Waste Swaps", image: UIImage(named: "img3")!, link: "https://www.goingzerowaste.com/blog/the-ultimate-list-of-zero-waste-swaps"),
            Article(title: "12 Things i've Stopped Buying Since Going Zero Waste", image: UIImage(named: "img5")!, link: "https://www.goingzerowaste.com/blog/12-things-ive-stopped-buying-since-going-zero-waste"),
            Article(title: "The Ultimate List of Zero Waste Swaps", image: UIImage(named: "img3")!, link: "https://www.goingzerowaste.com/blog/the-ultimate-list-of-zero-waste-swaps"),
            Article(title: "12 Things i've Stopped Buying Since Going Zero Waste", image: UIImage(named: "img5")!, link: "https://www.goingzerowaste.com/blog/12-things-ive-stopped-buying-since-going-zero-waste"),
            Article(title: "The Ultimate List of Zero Waste Swaps", image: UIImage(named: "img3")!, link: "https://www.goingzerowaste.com/blog/the-ultimate-list-of-zero-waste-swaps"),
            Article(title: "12 Things i've Stopped Buying Since Going Zero Waste", image: UIImage(named: "img5")!, link: "https://www.goingzerowaste.com/blog/12-things-ive-stopped-buying-since-going-zero-waste")]
    }
    
}
