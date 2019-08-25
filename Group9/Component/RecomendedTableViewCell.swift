//
//  RecomendedTableViewCell.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class RecomendedTableViewCell: UITableViewCell {

    @IBOutlet weak var recomendedCollectionView: UICollectionView!
    
    var spots = Spot.fetchData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    self.recomendedCollectionView.register(UINib(nibName: "RecomendedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recomendedCollectionViewCell")
        
        recomendedCollectionView.dataSource = self
        recomendedCollectionView.delegate = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}

extension RecomendedTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recomendedCollectionViewCell", for: indexPath) as! RecomendedCollectionViewCell
        
        let spot = spots[indexPath.item]
        cell.spot = spot
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
