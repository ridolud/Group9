//
//  SearchNewLocationViewController.swift
//  Group9
//
//  Created by Willa on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit


protocol parsingCityNameProtocol {
    func parsingCityName(with name: String)
}

class SearchNewLocationViewController: UIViewController {
    let placeModel = PlaceModel()
    let locationManager = LocationManager.instance
    var arrayOfCity = [String]()
    var arrayOfFilteredCity = [String]()
    var parsingDelegate: parsingCityNameProtocol!
    let searchBarController = UISearchController(searchResultsController: nil)
    
    @IBOutlet var tableViewOutlet: UITableView!
    @IBOutlet var typeSomethingButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeSomethingButtonOutlet.isEnabled = false
        //testing doanng
        setupNavBar()
        setTheSearchBar()
        setTheTableView()
        appendingDummyDataForTesting()
        tableViewOutlet.reloadData()
        
    }
    
    func setTheTableView(){
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    func setupNavBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
    }
    
    func setTheSearchBar(){
        searchBarController.searchResultsUpdater = self
        searchBarController.searchBar.delegate = self
        searchBarController.obscuresBackgroundDuringPresentation = false
        searchBarController.searchBar.placeholder = "Search for your location"
        searchBarController.searchBar.tintColor = #colorLiteral(red: 0.4470588235, green: 0.6156862745, blue: 0.2235294118, alpha: 1)
        navigationItem.searchController = searchBarController
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func useCurrentLocationItemBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            self.parsingDelegate.parsingCityName(with: self.locationManager.currentCity!)
        }
    }

    // MARK : - Functions/Methods Section
    
    func appendingDummyDataForTesting(){
        let dummyData = ["Jakarta Selatan", "Sleman", "Bandung", "Jakarta Pusat", "Surabaya", "Yogyakarta", "Denpasar", "Tangerang Selatan", "Depok", "Jakarta Timur", "Bekasi", "Surakarta", "Bogor"]
        for i in 0..<dummyData.count{
            arrayOfCity.append(dummyData.sorted()[i])
        }
    }
}

//MARK : - TableView Controller
extension SearchNewLocationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return arrayOfFilteredCity.count
        }
        return arrayOfCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchLocationCell", for: indexPath)
        if isFiltering() {
            cell.textLabel?.text = arrayOfFilteredCity[indexPath.row]
        }
        else {
            cell.textLabel?.text = arrayOfCity[indexPath.row]

        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.isFiltering(){
            self.parsingDelegate.parsingCityName(with: self.arrayOfFilteredCity[indexPath.row])
        }
        else {
            self.parsingDelegate.parsingCityName(with: self.arrayOfCity[indexPath.row])
        }
        searchBarController.isActive = false
        dismiss(animated: true, completion: nil)
    }
}

//MARK : - SearchBar Delegate
extension SearchNewLocationViewController: UISearchBarDelegate, UISearchResultsUpdating{
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        self.arrayOfFilteredCity = self.arrayOfCity.filter({( city : String) -> Bool in
            return city.lowercased().contains(searchText.lowercased())
        })
        self.tableViewOutlet.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchBarController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool{
        return !searchBarIsEmpty() && searchBarController.isActive
    }
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        arrayOfFilteredCity = arrayOfCity
//        typeSomethingButtonOutlet.isHidden = true
//        tableViewOutlet.isHidden = false
//        if searchBar.text != ""{
//            arrayOfFilteredCity = arrayOfCity.filter { (arrayOfCity) -> Bool in
//                return arrayOfCity.lowercased().contains(searchBar.text!)
//            }
//            tableViewOutlet.reloadData()
//        }else{
//            tableViewOutlet.reloadData()
//        }
//    }
    
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text != ""{
//            arrayOfFilteredCity = arrayOfCity.filter{$0.localizedCaseInsensitiveContains(searchText.lowercased())}
//        }else{
//            arrayOfFilteredCity = arrayOfCity
//        }
//        tableViewOutlet.reloadData()
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        if searchBar.text != ""{
//            arrayOfFilteredCity = arrayOfCity.filter{$0.localizedCaseInsensitiveContains(searchBar.text!.lowercased())}
//            tableViewOutlet.reloadData()
//        }else{
//            tableViewOutlet.reloadData()
//        }
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        arrayOfFilteredCity = arrayOfCity.filter{$0.localizedCaseInsensitiveContains(searchBar.text!.lowercased())}
//        tableViewOutlet.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        tableViewOutlet.isHidden = true
//        arrayOfFilteredCity = arrayOfCity
//        typeSomethingButtonOutlet.isHidden = false
//        tableViewOutlet.reloadData()
//        print("CANCLE BUTOTN TAPED")
//    }
//
    
}




