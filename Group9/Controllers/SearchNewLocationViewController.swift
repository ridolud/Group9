//
//  SearchNewLocationViewController.swift
//  Group9
//
//  Created by Willa on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit


protocol parsingCityNameProtocol {
    
    func parsingCityName(with name: String, isFromSearchVC: Bool)
}




class SearchNewLocationViewController: UIViewController {
    
    var arrayOfCity = [String]()
    var arrayOfFilteredCity = [String]()
    
    var parsingDelegate: parsingCityNameProtocol!
    
    @IBOutlet var tableViewOutlet: UITableView!
    
    @IBOutlet var typeSomethingButtonOutlet: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        typeSomethingButtonOutlet.isEnabled = false
        //testing doanng
        
        
        setTheSearchBar()
        setTheTableView()
        appendingDummyDayaForTesting()
        tableViewOutlet.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableViewOutlet.isHidden = true
        
       
        
        //print(arrayOfFilteredCity[indexPath.row - 1])
    }
    
    
    // MARK : - IBAction section
    @IBAction func panGestureAction(_ sender: UIPanGestureRecognizer) {
        //swipe to dismis but its not to complicated to implement on this app, it would be not hig

    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    
    
    
    @IBAction func useCurrentLocationItemBarButtonTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true) {
            //iya jalkan functon current location di
            self.parsingDelegate.parsingCityName(with: "unknown", isFromSearchVC: false)
        }
        
    }
    
    
    
    
    
    
    // MARK : - Functions/Methods Section
    func filteringData(){
        
        //arrayOfFilterCity.append(String)
    }
    
    func setTheSearchBar(){
        
        let searchBarController = UISearchController(searchResultsController: nil)
        
        searchBarController.searchBar.delegate = self
        searchBarController.obscuresBackgroundDuringPresentation = false
        searchBarController.searchBar.placeholder = "Search for your location"
        navigationItem.searchController = searchBarController
        
    }
    
    func setTheTableView(){
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
    }
    
    
    func appendingDummyDayaForTesting(){
        let dummyDaya = ["Jakarta Selatan", "Sleman", "Bandung", "Jakarta Pusat", "Surabaya", "Yogyakarta", "Denpasar", "Tangerang Selatan", "Depok", "Jakarta Timur", "Bekasi", "Surakarta", "Bogor"]
        for i in 0..<dummyDaya.count{
            arrayOfCity.append(dummyDaya[i])
        }
        
    }
    
    
    
}



//MARK : - TableView Controller
extension SearchNewLocationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfFilteredCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchLocationCell", for: indexPath)
        
        cell.textLabel?.text = arrayOfFilteredCity[indexPath.row]
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //parsing the data to previus controller with protocol
        
        self.dismiss(animated: true) {
            self.parsingDelegate.parsingCityName(with: self.arrayOfFilteredCity[indexPath.row], isFromSearchVC: true)
        }
    }
    
    
    
}


//MARK : - SearchBar Delegate
extension SearchNewLocationViewController: UISearchBarDelegate{
    
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

        arrayOfFilteredCity = arrayOfCity
        typeSomethingButtonOutlet.isHidden = true
        tableViewOutlet.isHidden = false
        if searchBar.text != ""{
            arrayOfFilteredCity = arrayOfCity.filter { (arrayOfCity) -> Bool in
                return arrayOfCity.lowercased().contains(searchBar.text!)
            }
            tableViewOutlet.reloadData()
            
        }else{
            tableViewOutlet.reloadData()
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text != ""{
            
//            arrayOfFilteredCity = arrayOfCity.filter { (arrayOfCity) -> Bool in
//                return arrayOfCity.lowercased().contains(searchText)
//
//            }
            arrayOfFilteredCity = arrayOfCity.filter{$0.localizedCaseInsensitiveContains(searchText.lowercased())}
            

          
        }else{
            arrayOfFilteredCity = arrayOfCity
    
        }
        
        tableViewOutlet.reloadData()
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        
        if searchBar.text != ""{
            arrayOfFilteredCity = arrayOfCity.filter{$0.localizedCaseInsensitiveContains(searchBar.text!.lowercased())}
            tableViewOutlet.reloadData()
            
        }else{

            tableViewOutlet.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        arrayOfFilteredCity = arrayOfCity.filter{$0.localizedCaseInsensitiveContains(searchBar.text!.lowercased())}
        tableViewOutlet.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableViewOutlet.isHidden = true
        arrayOfFilteredCity = arrayOfCity
        typeSomethingButtonOutlet.isHidden = false
        tableViewOutlet.reloadData()
        print("CANCLE BUTOTN TAPED")
    }
    
    
}




