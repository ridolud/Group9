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
    
    var delegate: StoreTableViewCellDelegate?
    
    @IBOutlet weak var seeAllButtonOutlet: UIButton!
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
        if let category = category {
            self.delegate?.didSelectedPlaceCategory(category: category)
        }
    }
    
    func didFetchRecords() {
        isLoading = false
        storeCollection.reloadData()
        self.delegate?.reloadTableView()
    }
    
    func buildUpView(PlaceCategory category: PlaceCategory) {
        self.category = category
        self.categoryPlace.text = self.category?.description
        // Fetching Data
//        if LocationManager.instance.currentLocation != nil {
//            print(#function)
            placeModel.get(ByCategory: category)
//        }
    }
    
    func buildUpSimilar(PlaceCategory category: PlaceCategory){
        self.category = category
        self.categoryPlace.text = "Similar Place"
        // Fetching Data
//        if LocationManager.instance.currentLocation != nil {

            placeModel.get(ByCategory: category)
//        }

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
            cell.loadPlace(place: placeModel.places[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isLoading {
            delegate?.didSelectedPlace(place: placeModel.places[indexPath.row])
        }
    }
    
}

protocol StoreTableViewCellDelegate {
    
    func didSelectedPlace(place: Place)
    
    func didSelectedPlaceCategory(category: PlaceCategory)
    
    func reloadTableView()
}
