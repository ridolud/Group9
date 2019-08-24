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
        database.perform(query, inZoneWith: nil, completionHandler: {
            (records, error) in
            
            guard let records = records else { return }
            
            DispatchQueue.main.async {
                self.passingData(records: records)
                
                // finish fetching data
                self.delegate?.didFetchRecords?()
            }
        })
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
    
    func errorHandler(error: Any?) {
        return print(error as Any)
    }
}

