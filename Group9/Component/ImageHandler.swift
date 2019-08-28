
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
        do{
            let data = try Data(contentsOf: url!)
            if let image = UIImage(data: data){
                self.image = image
            }
            else{
                print ("couldnt decode image")
            }
        }catch{
            print("url not found")
        }
    }
    
    
}

