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
        queryOperation.qualityOfService = .userInteractive
        queryOperation.desiredKeys = ["name", "address", "kelurahan", "kecamatan", "kota", "category"]
        
        queryOperation.recordFetchedBlock = { tempRecord in
            DispatchQueue.main.async {
                self.passingData(record: tempRecord)
            }
        }
        queryOperation.queryCompletionBlock =  { queryCursor,error in
            DispatchQueue.main.async {
                self.delegate?.didFetchRecords?()
            }
        }
        print(#function, query)
        database.add(queryOperation)

    }
    
    func fetchImage(scope: CKDatabase.Scope, byQuery query: CKQuery) {
        // start fetching data
        self.delegate?.willFetchRecords?()
        
        let database = self.setScopeDatabase(scope: scope)
        let queryImageOperation = CKQueryOperation()
        
        queryImageOperation.query = query
        queryImageOperation.qualityOfService = .background
        queryImageOperation.desiredKeys = ["feature_img"]

        queryImageOperation.recordFetchedBlock = { tempRecord in
            DispatchQueue.global(qos: .background).async {
                print(#function, tempRecord)

                if let img = tempRecord.object(forKey: "feature_img") as? CKAsset {
                    self.passingImage(record : tempRecord, img : img )
                }
            }
        }
        queryImageOperation.queryCompletionBlock =  { queryCursor,error in
            DispatchQueue.main.async {
                self.delegate?.didFetchImage?()
            }
        }
        database.add(queryImageOperation)
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

