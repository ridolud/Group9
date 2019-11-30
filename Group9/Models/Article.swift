
//
//  Article.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 23/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

struct Article{  
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
            Article(title: "What is Zero Waste? (Indonesia)", image: #imageLiteral(resourceName: "image01"), link: "https://zerowaste.id/knowledge/what-is-zero-waste-anyway/"),
            Article(title: "A Beginner’s Guide to Zero Waste Living", image: #imageLiteral(resourceName: "image07"), link: "http://trashisfortossers.com/a-beginners-guide-to-zero-waste-living-ps-it-doesnt-happen-overnight/"),
            Article(title: "101 Easy Eco Friendly Zero Waste Tips", image: #imageLiteral(resourceName: "image05"), link: "https://www.goingzerowaste.com/blog/101-easy-eco-friendly-zero-waste-tips"),
            Article(title: "The Ultimate List of Zero Waste Swaps", image: #imageLiteral(resourceName: "image08"), link: "https://www.goingzerowaste.com/blog/the-ultimate-list-of-zero-waste-swaps"),
            Article(title: "Ten tips for a zero waste home by Bea Johnson", image: #imageLiteral(resourceName: "image04"), link: "https://www.penguin.co.uk/articles/2016/ten-tips-for-a-zero-waste-home/"),
            Article(title: "17 Ways To Live Trash-Free & Adopt A Zero-Waste Lifestyle", image: #imageLiteral(resourceName: "image03"), link: "https://selfeco.com/blogs/selfeco-blog/100-ways-to-live-trash-free-adopt-a-zero-waste-lifestyle"),
            Article(title: "What I learned from adopting a ‘zero waste’ lifestyle", image: #imageLiteral(resourceName: "image06"), link: "https://www.cnbc.com/2018/11/14/how-to-start-a-zero-waste-lifestyle.html"),
            
        ]
    }
}
