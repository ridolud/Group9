//
//  RecomendedTableViewCell.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class RecomendedTableViewCell: UITableViewCell, DatabaseDelegate {

    @IBOutlet weak var recomendedCollectionView: UICollectionView!
    
    
    var recommendedDelegate: RecommendedTableViewCellDelegate?
    
    let placeModel = PlaceModel()
    
    var category : PlaceCategory?
    
    var isLoading  = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    self.recomendedCollectionView.register(UINib(nibName: "RecomendedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recomendedCollectionViewCell")
        
        recomendedCollectionView.dataSource = self
        recomendedCollectionView.delegate = self
        
        placeModel.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func didFetchRecords(){
        isLoading = false
        recomendedCollectionView.reloadData()
    }
    
    func buildUpView(PlaceCategory category : PlaceCategory){
        self.category = .store
        
        // Fetching Data
        placeModel.get(ByCategory: category)
    }
}

extension RecomendedTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isLoading {
            return 3
        }
        return placeModel.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recomendedCollectionViewCell", for: indexPath) as! RecomendedCollectionViewCell
        
        cell.isLoading = isLoading
        
        if !isLoading{
            cell.loadPlace(place:placeModel.places[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isLoading {
            recommendedDelegate?.didSelectedRecommended(place: placeModel.places[indexPath.row])
        }
    }
    
}

protocol RecommendedTableViewCellDelegate{
    func didSelectedRecommended(place: Place)
}
