//
//  Place.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

struct Spot {
    var title:String
    var image:UIImage
    var description:String
    
    init(title:String,image:UIImage,description:String) {
        self.title = title
        self.image = image
        self.description = description
    }
    
    static func fetchData() -> [Spot]{
        return [
        Spot(title: "Pasar Jangkrik", image: #imageLiteral(resourceName: "img"), description: "Pasar yg ada jangkriknya banyak banget kadang kadang "),
        Spot(title: "Pasar Kamis", image: #imageLiteral(resourceName: "img6"), description: "Pasar yg ada bukanya cuma hari kamis kayaknya"),
        Spot(title: "Pasar Ahad", image: #imageLiteral(resourceName: "img4"), description: "Pasar yg ada bukanya cuma hari ahad kayaknya"),
        Spot(title: "Pasar Rabu", image: #imageLiteral(resourceName: "img5"), description: "Pasar yg ada bukanya cuma hari rabu kayaknya"),
        Spot(title: "Pasar Selasa", image: #imageLiteral(resourceName: "img2"), description: "Pasar yg ada bukanya cuma hari selasa kayaknya"),
        Spot(title: "Pasar Senen", image: #imageLiteral(resourceName: "img3"), description: "Pasar yg ada bukanya cuma hari senen kayaknya"),
        Spot(title: "Pasar Ahad", image: #imageLiteral(resourceName: "img4"), description: "Pasar yg ada bukanya cuma hari ahad kayaknya"),
        Spot(title: "Pasar Rabu", image: #imageLiteral(resourceName: "img5"), description: "Pasar yg ada bukanya cuma hari rabu kayaknya"),
        Spot(title: "Pasar Selasa", image: #imageLiteral(resourceName: "img2"), description: "Pasar yg ada bukanya cuma hari selasa kayaknya"),
        Spot(title: "Pasar Senen", image: #imageLiteral(resourceName: "img3"), description: "Pasar yg ada bukanya cuma hari senen kayaknya"),
        Spot(title: "Pasar Ahad", image: #imageLiteral(resourceName: "img4"), description: "Pasar yg ada bukanya cuma hari ahad kayaknya"),
        Spot(title: "Pasar Rabu", image: #imageLiteral(resourceName: "img5"), description: "Pasar yg ada bukanya cuma hari rabu kayaknya"),
        Spot(title: "Pasar Selasa", image: #imageLiteral(resourceName: "img2"), description: "Pasar yg ada bukanya cuma hari selasa kayaknya"),
        Spot(title: "Pasar Senen", image: #imageLiteral(resourceName: "img3"), description: "Pasar yg ada bukanya cuma hari senen kayaknya"),
        Spot(title: "Pasar Ahad", image: #imageLiteral(resourceName: "img4"), description: "Pasar yg ada bukanya cuma hari ahad kayaknya"),
        Spot(title: "Pasar Rabu", image: #imageLiteral(resourceName: "img5"), description: "Pasar yg ada bukanya cuma hari rabu kayaknya"),
        Spot(title: "Pasar Selasa", image: #imageLiteral(resourceName: "img2"), description: "Pasar yg ada bukanya cuma hari selasa kayaknya"),
        Spot(title: "Pasar Senen", image: #imageLiteral(resourceName: "img3"), description: "Pasar yg ada bukanya cuma hari senen kayaknya"),
        ]
    }
    
    
    
    
}
