//
//  DBModel.swift
//  Group9
//
//  Created by Faridho Luedfi on 25/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import CloudKit
import UIKit

class DBModel {
    
    let container = CKContainer(identifier: "iCloud.com.ridolud.Group9")
    
    let databasePublic: CKDatabase
    
    let databasePrivate: CKDatabase
    
    let databaseShare: CKDatabase
    
    weak var delegate: DatabaseDelegate? 
    
    var query: CKQuery?
    
    init() {
        self.databasePublic = container.publicCloudDatabase
        self.databasePrivate = container.privateCloudDatabase
        self.databaseShare = container.sharedCloudDatabase
    }
    
    func fetch(scope: CKDatabase.Scope, byQuery query: CKQuery) {
        // start fetching data
        self.delegate?.willFetchRecords?()
        
        let database = self.setScopeDatabase(scope: scope)
        let queryOperation = CKQueryOperation()
        
        queryOperation.query = query
        queryOperation.resultsLimit = 5
        queryOperation.qualityOfService  = .userInteractive
        queryOperation.desiredKeys = ["name", "address", "kelurahan", "kecamatan", "kota", "category"]
        
        queryOperation.recordFetchedBlock = { tempRecord in
            DispatchQueue.main.async {
                print(#function, "quesry fetch record block")
                
                self.passingData(record: tempRecord)
            }
        }
        queryOperation.queryCompletionBlock =  { queryCursor,error in
            DispatchQueue.main.async {
                print(#function, "quesry completition block")
                //self.passingData(record: record!)
                // finish fetching data
                self.delegate?.didFetchRecords?()
            }
        }
        database.add(queryOperation)

    }
    
    func fetchImage(scope: CKDatabase.Scope, byQuery query: CKQuery) {
        // start fetching data
        self.delegate?.willFetchRecords?()
        
        let database = self.setScopeDatabase(scope: scope)
        let queryImageOperation = CKQueryOperation()
        
        queryImageOperation.query = query
        queryImageOperation.resultsLimit = 5
        queryImageOperation.qualityOfService = .background
        queryImageOperation.desiredKeys = ["feature_img"]

        queryImageOperation.recordFetchedBlock = { tempRecord in
            DispatchQueue.main.async {
                if let img = tempRecord.object(forKey: "feature_img") as? CKAsset {
                    self.passingImage(record : tempRecord, img : img )
                }
            }
        }
        queryImageOperation.queryCompletionBlock =  { queryCursor,error in
            
        }
        
        database.add(queryImageOperation)

        
        
        
//
//        database.perform(query, inZoneWith: nil, completionHandler: {
//            (records, error) in
//
//            guard let records = records else { return }
//
//            DispatchQueue.main.async {
//                self.passingData(records: records)
//
//                // finish fetching data
//                self.delegate?.didFetchRecords?()
//            }
//        })
    }
    
    private func setScopeDatabase(scope: CKDatabase.Scope) -> CKDatabase {
        switch scope {
        case .private:
            return self.databasePrivate
        case .shared:
            return self.databaseShare
        default:
            return self.databasePublic
        }
    }
    
    func passingData(records: [CKRecord]) {
        return
    }
    
    func passingData(record: CKRecord) {
        return
    }
    func passingImage(record: CKRecord, img: CKAsset) {
        return
    }
    
    func errorHandler(error: Any?) {
        return print(error as Any)
    }
}

