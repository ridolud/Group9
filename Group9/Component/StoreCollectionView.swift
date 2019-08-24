//
//  StoreCollectionView.swift
//  Group9
//
//  Created by Faridho Luedfi on 22/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//
import UIKit
import CloudKit

class StoreCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, DatabaseDelegate {
    
    let placeModel = PlaceModel()
    
    public var categoryName: String = ""
    
    static let instance = StoreCollectionView()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var wrapper: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    Bundle.main.loadNibNamed("StoreCollection", owner: self, options: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibName = UINib(nibName: "StoreCollectionCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "storeCell")
        
        collectionView.isPagingEnabled = true
        
        placeModel.delegate = self
        placeModel.get()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didFetchRecords() {
        print(placeModel.places)
        collectionView.reloadData()
    }
    
    func willFetchRecord() {
        print("start")
    }
    
    func errorConection(error: Error) {
        print(error)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeModel.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for:  indexPath) as! StoreCollectionCell
        
        cell.nameLabel.text = placeModel.places[indexPath.row].name
        
        return cell
    }
}
