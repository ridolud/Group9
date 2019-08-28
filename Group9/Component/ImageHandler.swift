
//
//  ImageHandler.swift
//  Group9
//
//  Created by Faridho Luedfi on 26/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadFromUrl(_ url: URL?) {
        if let url = url {
            if let data = NSData(contentsOf: url) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
    
    
}

