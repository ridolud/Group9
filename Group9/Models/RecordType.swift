//
//  File.swift
//  Group9
//
//  Created by Faridho Luedfi on 22/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import CloudKit
import UIKit

enum RecordType: String, CustomStringConvertible {
    var description: String {
        switch self {
        case .user:
            return "User"
        case .place:
            return "Place"
        case .favorite:
            return "Favorite"
        }
    }
    
    case user = "User", place = "Place", favorite = "Favorite"
}
