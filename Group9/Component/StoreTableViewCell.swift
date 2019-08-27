//
//  StoreTableViewCell.swift
//  Group9
//
//  Created by Faridho Luedfi on 26/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell, UICollectionViewDelegate, DatabaseDelegate {
    
    @IBOutlet weak var categoryPlace: UILabel!
    
    @IBOutlet weak var storeCollection: UICollectionView!
    
    let placeModel = PlaceModel()
    
    var category: PlaceCategory?
    
    var isLoading = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Delegation
        storeCollection.delegate = self
        storeCollection.dataSource = self
        placeModel.delegate = self
        
        let nibName = UINib(nibName: "StoreCollectionCell", bundle:nil)
        storeCollection.register(nibName, forCellWithReuseIdentifier: "storeCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func seeAllAction(_ sender: UIButton) {
        // see all places collection
    }
    
    func didFetchRecords() {
        isLoading = false
        storeCollection.reloadData()
    }
    
    func buildUpView(PlaceCategory category: PlaceCategory) {
        self.category = category
        self.categoryPlace.text = self.category?.description
        
        // Fetching Data
        placeModel.get(ByCategory: category)
        
    }
    
}

extension StoreTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isLoading {
            return 2
        }
        return placeModel.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "storeCell", for:  indexPath) as! StoreCollectionCell
        
        cell.isLoading = isLoading
        
        if !isLoading {
            cell.nameLabel.text = placeModel.places[indexPath.row].name
            cell.addressLabel.text = "1.8 km - \(placeModel.places[indexPath.row].kecamatan!), \(placeModel.places[indexPath.row].kota!) "
            cell.imagePlace.loadFromUrl(placeModel.places[indexPath.row].featureImgUrl)
        }
        
        return cell
    }
    
}
