//
//  UIAplication.swift
//  Group9
//
//  Created by Faridho Luedfi on 31/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
    
}
