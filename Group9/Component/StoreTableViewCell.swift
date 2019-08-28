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
    
    let placeModel = PlaceModel.instance
    var category: PlaceCategory?
    var isLoading = true
    var isLoadingImage = true
    var delegate: StoreTableViewCellDelegate?
    var tempArr = [Place]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Delegation
        storeCollection.delegate = self
        storeCollection.dataSource = self
//        placeModel.delegate = self
//        placeModel.emptyPlaces()
        
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
    
    func didFetchRecords(places : [Place]) {
        isLoading = false
        tempArr = places
        print(tempArr)
        storeCollection.reloadData()
    }
    
    func didFetchImage(places : [Place]) {
        isLoadingImage = false
        tempArr = places
        print(tempArr)
        storeCollection.reloadData()
    }
    
    func buildUpView(PlaceCategory category: PlaceCategory) {
        self.category = category
        self.categoryPlace.text = self.category?.description
        
        // Fetching Data
//        placeModel.get(ByCategory: category)
        
    }
    
}

extension StoreTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isLoading {
            return 2
        }
        return tempArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storeCollection.dequeueReusableCell(withReuseIdentifier: "storeCell", for:  indexPath) as! StoreCollectionCell
        
        cell.isLoading = isLoading
        cell.isLoadingImage = isLoadingImage
        if !isLoading {
            cell.nameLabel.text = tempArr[indexPath.row].name
            cell.addressLabel.text = "1.8 km - \(tempArr[indexPath.row].kecamatan!), \(tempArr[indexPath.row].kota!) "
        }

        if !isLoadingImage {            cell.imagePlace.loadFromUrl(tempArr[indexPath.row].featureImgUrl)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if !isLoading {
//            delegate?.didSelectedPlace(place: placeModel.places[indexPath.row])
//        }
    }
    
}

protocol StoreTableViewCellDelegate {
    func didSelectedPlace(place: Place)
}
