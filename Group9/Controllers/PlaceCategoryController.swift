//
//  PlaceCategoryController.swift
//  Group9
//
//  Created by Faridho Luedfi on 28/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class PlaceCategoryController: UITableViewController, DatabaseDelegate {
    
    var category: PlaceCategory!
    
    var placeModel = PlaceModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placeModel.delegate = self
        self.placeModel.get(ByCategory: category)
        self.title = category.description
        
       //self.refreshControl?.addTarget(self, action: #selector(refreshTable), for: .valueChanged) //disable refresher
    }
    
//    @objc func refreshTable(_ sender: Any) { //disable refresher
//        self.placeModel.get(ByCategory: category)
//    }
    
    
    func didFetchRecords() {
        print(#function, "execute")
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeModel.places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StoreListTableViewCell", owner: self, options: nil)?.first as! StoreListTableViewCell
        
        let place = placeModel.places[indexPath.row]
        
        cell.storeName.text = place.name
        cell.storeImage.loadFromUrl(place.featureImgUrl)
        let distance = Int(((LocationManager.instance.currentLocation?.distance(from: place.location!))!))
        cell.storeAddress.text = "\(distance/1000) km - \(place.kecamatan), \(place.kota)"
        cell.storeTime.text = place.openHour
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = placeModel.places[indexPath.row]
        print(#function, place)
        performSegue(withIdentifier: "placeCategoryToDetailPlace", sender: place)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "placeCategoryToDetailPlace" {
            let placeDetailViewController: PlaceDetailViewController = segue.destination as! PlaceDetailViewController
            placeDetailViewController.currentPlace = sender as? Place
        }
    }

}
