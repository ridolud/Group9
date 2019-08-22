//
//  StoreCollectionView.swift
//  Group9
//
//  Created by Faridho Luedfi on 22/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//
import UIKit
import CloudKit

class StoreCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let instance = StoreCollectionView()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var wrapper: UIView!
    
    let database = CKContainer.default().publicCloudDatabase
    
    var places = [CKRecord]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    Bundle.main.loadNibNamed("StoreCollection", owner: self, options: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibName = UINib(nibName: "StoreCollectionCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "storeCell")
        
        collectionView.isPagingEnabled = true
        self.fetchPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchPlace() {
        let query = CKQuery(recordType: RecordType.place.rawValue, predicate: .init(value: true))
        database.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else {return}
            self.places = records
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for:  indexPath) as! StoreCollectionCell
        
        cell.nameLabel.text = (places[indexPath.row].value(forKey: "name") as! String)
        
        return cell
    }
}
