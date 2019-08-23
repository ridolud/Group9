//
//  File.swift
//  Group9
//
//  Created by Faridho Luedfi on 21/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//


import CloudKit
import UIKit

enum CategoryPlace: String, CustomStringConvertible {
    case store = "store", repair = "repair", food = "food", comunity = "community"
    
    var description: String {
        switch self {
        case .store:
            return "Store"
        case .repair:
            return "Repair Store"
        case .food:
            return "Foods & Drinks"
        case .comunity:
            return "Comunity"
        }
    }
}

struct Place {
    let id: Int
    let name: Int
    let address: String
    let category: CategoryPlace
}

class PlaceModel {
    
    static let instance = PlaceModel()
    
    private let database = CKContainer.default().publicCloudDatabase
    
    private let query = CKQuery(recordType: RecordType.place.description, predicate: .init(value: true))
    
    init() {}
    
    var places = [Place]()
    
    var records = [CKRecord]()
    
    func fetchAll( callback: ((_ result: [CKRecord]) -> Void)? ) {
        
        self.database.perform(self.query, inZoneWith: nil) { (records, error) in
            guard let records = records else { return }
                self.records = records
            
            DispatchQueue.main.async {
                callback!(self.records)
            }
        }
    }
    
}

