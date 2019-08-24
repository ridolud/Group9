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
    
    static let instance = StoreCollectionView()
    
    let placeModel = PlaceModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var placeCategoryLabel: UILabel!
    @IBOutlet var wrapper: UIView!
    @IBOutlet weak var seeAllButton: UIButton!
    
    var placeCategory: PlaceCategory = .store {
        didSet {
            setUpView()
            placeModel.get()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("StoreCollection", owner: self, options: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibName = UINib(nibName: "StoreCollectionCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "storeCell")
        
        placeModel.delegate = self
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        placeCategoryLabel.text = placeCategory.description
        collectionView.isPagingEnabled = true
    }
    
    func didFetchRecords() {
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeModel.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for:  indexPath) as! StoreCollectionCell
        
        return cell
    }
}
