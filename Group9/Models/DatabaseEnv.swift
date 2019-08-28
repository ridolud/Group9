//
//  DatabaseEnv.swift
//  Group9
//
//  Created by Faridho Luedfi on 25/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import CloudKit
import UIKit

@objc protocol DatabaseDelegate {
    
    @objc optional func didFetchRecords()
    
    @objc optional func didFetchRecord()
    
    @objc optional func willFetchRecords()
    
    @objc optional func willFetchRecord()
    
    @objc optional func errorConection(error: Error)
    
    @objc optional func didFetchImage()
    
}

enum RecordType: String {
    case place = "Place", favorite = "Favorite"
}
