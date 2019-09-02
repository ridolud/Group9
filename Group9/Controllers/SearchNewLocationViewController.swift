//
//  SearchNewLocationViewController.swift
//  Group9
//
//  Created by Willa on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit


protocol parsingCityNameProtocol {
    func parsingCityName(with name: String, isChoosingCity : Bool)
}

class SearchNewLocationViewController: UIViewController, DatabaseDelegate {
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
        placeModel.delegate = self
        typeSomethingButtonOutlet.isEnabled = false
        //testing doanng
        setupNavBar()
        setTheSearchBar()
        setTheTableView()
        appendData()
        tableViewOutlet.reloadData()
        
    }
    
    func setTheTableView(){
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        placeModel.getCity()
    }
    
    func setupNavBar(){
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.backgroundColor = .white
            self.navigationController?.view.backgroundColor = .white
            self.navigationController?.navigationBar.prefersLargeTitles = true
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
            self.parsingDelegate.parsingCityName(with: self.locationManager.currentCity!, isChoosingCity: false)
        }
    }

    // MARK : - Functions/Methods Section
    
    
    func didFetchRecords() {
        appendData()
        tableViewOutlet.reloadData()
    }
    
    func appendData(){
        for place in placeModel.places{
            arrayOfCity.append(place.kota)
        }
        let uniqueSet = Set(arrayOfCity)
        arrayOfCity = Array(uniqueSet).sorted()
        for i in stride(from: arrayOfCity.count - 1, to: -1, by: -1) {
            if arrayOfCity[i] == "" {
                arrayOfCity.remove(at: i)
            }
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
            self.parsingDelegate.parsingCityName(with: self.arrayOfFilteredCity[indexPath.row], isChoosingCity : true)
        }
        else {
            self.parsingDelegate.parsingCityName(with:
                self.arrayOfCity[indexPath.row], isChoosingCity : true)
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




