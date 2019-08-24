//
//  File.swift
//  Group9
//
//  Created by Faridho Luedfi on 21/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//


import CloudKit
import UIKit

import CloudKit
import UIKit

enum PlaceCategory: String, CustomStringConvertible {
    case store = "store", repair = "repair", food = "food", comunity = "community"
    
    var description: String {
        switch self {
        case .store:
            return "Grocery Store"
        case .repair:
            return "Repair Store"
        case .food:
            return "Foods & Drinks"
        case .comunity:
            return "Comunities"
        }
    }
}

struct Place{
    let id: String
    let name: String?
    let address: String?
    let featrueImg: UIImage?
    let location: CLLocation?
}

class PlaceModel: DBModel {
    
    var places = [Place]()
    
    override init() {
        super.init()
        self.query = .init(recordType: RecordType.place.rawValue, predicate: .init(value: true))
    }
    
    func get() {
        guard let query = self.query else { return }
        self.fetch(scope: .public, byQuery: query)
    }
    
    override func passingData(records: [CKRecord]) {
        for record in records {
            self.recordToPlace(record)
        }
    }
    
    private func recordToPlace(_ record: CKRecord) {
        let name: String? = (record.value(forKey: "name") as! String)
        let address: String? = (record.value(forKey: "address") as! String)
        self.places.append(.init(id: record.recordID.recordName, name: name, address: address, featrueImg: nil, location: nil))
    }
    
}

