
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
//        print(#function, url)
//        if let imageUrl = url {
//            DispatchQueue.global(qos: .background).async { [weak self] in
//                if let data = try? Data(contentsOf: imageUrl) {
//                    if let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            self?.image = image
//                        }
//                    }
//                }
//            }
//        }
        
        if let url = url {
            if let data = NSData(contentsOf: url) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
    
    
}

