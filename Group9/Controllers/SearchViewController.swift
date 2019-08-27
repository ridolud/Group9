//
//  SearchViewController.swift
//  Group9
//
//  Created by Willa on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import CloudKit

class SearchViewController: UIViewController, parsingCityNameProtocol {
   
    var cityName = "Unknown"
    var isFromSeachCity = false


    @IBOutlet var popularView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = cityName
        
        setTheWrapper()
        setTheSearchbar()
    
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if isFromSeachCity{
            print("ini true")
            navigationItem.title = cityName
            isFromSeachCity = false
            
        }else{
            print("ini false")
            //fetch location and then reverseGeoCoder to find the city based on the location
        }
    }
    
    
    
    
    
    

    //MARK : - IBAction Collection
    
    @IBAction func changeLocationButtonTapped(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "toChangeLocationVC", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toChangeLocationVC"{
            
            let nav = segue.destination as! UINavigationController
            let destinationVC = nav.topViewController as! SearchNewLocationViewController
            destinationVC.parsingDelegate = self
        }
    }
    
    

    
    
    @IBAction func sortByButtonTapped(_ sender: UIButton) {
        print("sort by button tapped")
        let alert = UIAlertController(title: "Sort By", message: "Select your Sorting", preferredStyle: .actionSheet)
    
        let sortByRating = UIAlertAction(title: "Rating", style: .default) { (action) in
            self.sort(by: "Rating")
        }
        let sortByTrending = UIAlertAction(title: "Trending", style: .default) { (action) in
            self.sort(by: "Trending")
        }
        let sortByNew = UIAlertAction(title: "New", style: .default) { (action) in
            self.sort(by: "New")
        }
        let cancle = UIAlertAction(title: "Cancel", style: .cancel) { (nothing) in
            
        }
        
        alert.addAction(sortByRating)
        alert.addAction(sortByTrending)
        alert.addAction(sortByNew)
        alert.addAction(cancle)
        self.present(alert, animated: true)
    }
    
    
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        print("Category button tapped")
        let alert = UIAlertController(title: "Category", message: "Select your Category", preferredStyle: .actionSheet)
        
        let filterByRepairServices = UIAlertAction(title: "Repair Services", style: .default) { (action) in
            self.filter(by: "Repair Services")
        }
        let filterByStore = UIAlertAction(title: "Store", style: .default) { (action) in
            self.filter(by: "Store")
        }
        let filterByDrinkingRefillSpot = UIAlertAction(title: "Drinking Refill Spot", style: .default) { (action) in
            self.filter(by: "Drinking Refill Spot")
        }
        let cancle = UIAlertAction(title: "Cancel", style: .cancel) { (nothing) in
            
        }
        
        alert.addAction(filterByRepairServices)
        alert.addAction(filterByStore)
        alert.addAction(filterByDrinkingRefillSpot)
        alert.addAction(cancle)
        self.present(alert, animated: true)
        
    }
    
    
    
    //MARK : Function Collection
    func setTheWrapper() {
        
        //let wrapper = StoreCollectionView.instance
        let wrapper = StoreCollectionView()
        wrapper.categoryName = "Popular Store"
        
        popularView.addSubview(wrapper.wrapper!)
        
        //the data that we need
        PlaceModel.instance.fetchAll(callback: { (ckrRecord) in
            wrapper.places = ckrRecord
            wrapper.collectionView.reloadData()
        })
     
    }
    
    
    func setTheSearchbar(){
        
        let searchBarController = UISearchController(searchResultsController: nil)
        
        searchBarController.searchBar.delegate = self
        searchBarController.obscuresBackgroundDuringPresentation = false
        searchBarController.searchBar.placeholder = "Place Name"
        navigationItem.searchController = searchBarController
        
    }
    
    
    //protocol Function
    func parsingCityName(with name: String, isFromSearchVC: Bool) {
        self.isFromSeachCity = isFromSearchVC
        self.cityName = name
    }
    
    
    // MARK : - Sort Function
    func sort(by sorting: String){
        if sorting == "Rating"{
            print("sort by rating")
        }else if sorting == "Trending"{
            print("sort by tranding")
        }else if sorting == "New"{
            print("sort by new")
        }
        
    }
    
    // MARK : - Filter Function
    func filter(by filter: String){
        if filter == "Repair Services"{
            print(filter)
        }else if filter == "Store"{
            print(filter)
        }else if filter == "Drinking Refill Spot"{
            print(filter)
        }
        
    }
    
    


}


extension SearchViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.text)
    }
    
}

