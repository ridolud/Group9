
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
                let image = UIImage(data: data as Data)
                let compressedImage = image!.highestQuality
                self.image = UIImage(data: compressedImage as Data)
            }
        }
    }
}

extension UIImage {
    
    var highestQuality: NSData { return jpegData(compressionQuality: 1)! as NSData }
    var highQuality: NSData { return jpegData(compressionQuality: 0.75)! as NSData }
    var midQuality: NSData { return jpegData(compressionQuality: 0.5)! as NSData }
    var lowQuality: NSData { return jpegData(compressionQuality: 0.25)! as NSData }
    var lowestQuality: NSData { return jpegData(compressionQuality: 0)! as NSData }
}
