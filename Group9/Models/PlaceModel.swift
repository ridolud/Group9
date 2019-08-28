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
    case store = "store", repair = "repair", food = "food", community = "community", refill="refill"
    
    var description: String {
        switch self {
        case .store:
            return "Grocery Store"
        case .repair:
            return "Repair Store"
        case .food:
            return "Foods & Drinks"
        case .community:
            return "Comunities"
        case .refill:
            return "Water Refill Spot"
        }
    }
}

struct Place {
    let id: String
    let name: String
    let address: String
    let kelurahan: String
    let kecamatan: String
    let kota: String
    var featureImgUrl: URL?
    let location: CLLocation?
    let category: PlaceCategory
    
    mutating func changeImageURL( url : URL){
        self.featureImgUrl = url
    }
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
    
    func get(ByCategory category: PlaceCategory) {
        let filter = category.rawValue
        self.query = .init(recordType: RecordType.place.rawValue, predicate: NSPredicate(format: "category == %@", filter))
        guard let query = self.query else { return }
        self.fetch(scope: .public, byQuery: query)
    }
    
    override func passingData(records: [CKRecord]) {
        for record in records {
            self.recordToPlace(record)
        }
    }
    
    private func recordToPlace(_ record: CKRecord) {
        self.places.append(
            .init(
                id: record.recordID.recordName,
                name: self.checkString("name", record: record),
                address: self.checkString("kelurahan", record: record),
                kelurahan: self.checkString("kelurahan", record: record),
                kecamatan: self.checkString("kecamatan", record: record),
                kota: self.checkString("kota", record: record),
                featureImgUrl: self.checkUrl("feature_img", record: record),
                location: nil,
                category: self.checkCategory(record: record)
            )
        )
    }
    
    private func checkString(_ field: String, record: CKRecord) -> String {
            return (record.value(forKey: field)) != nil ? (record.value(forKey: field) as! String) : ""
    }
    
    private func checkCategory(record: CKRecord) -> PlaceCategory {
        let categoryRaw = self.checkString("category", record: record)
        switch categoryRaw {
        case PlaceCategory.store.rawValue:
            return PlaceCategory.store
        default:
            return PlaceCategory.community
        }
    }
    
    private func checkUrl(_ field: String, record: CKRecord) -> URL? {
        if let recordFile = record.value(forKey: field) {
            if let file: CKAsset = (recordFile as! CKAsset) {
                print(#function, file.fileURL)
                return file.fileURL
            }
        }else{
            return nil
        }
    }
    
    
    
}

