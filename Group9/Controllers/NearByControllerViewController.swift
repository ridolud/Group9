//
//  NearByControllerViewController.swift
//  Group9
//
//  Created by Faridho Luedfi on 21/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit


class NearByControllerViewController: UIViewController, LocationManagerDelegate {
    
    @IBOutlet weak var recommendView: UIView!
    @IBOutlet weak var inputPlace: UIButton!
    
    @IBOutlet weak var nearbyTableView: UITableView!
    let locationManager = LocationManager.instance
    let selectedPlaceCategory: [PlaceCategory] = [.store, .repair, .refill]
    var isChoosingCity = false
    var isDummy = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupLocation()
        setupRecommendView()
        self.nearbyTableView.register(UINib.init(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "articleTableViewCell")
        self.nearbyTableView.register(UINib.init(nibName: "RecomendedTableViewCell", bundle: nil), forCellReuseIdentifier: "recomendedTableViewCell")
        self.nearbyTableView.register(UINib.init(nibName: "StoreTableViewCell", bundle: nil), forCellReuseIdentifier: "storeTableViewCell")
        self.nearbyTableView.register(UINib.init(nibName: "InputPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "inputPlaceTableViewCell")
        
        nearbyTableView.delegate = self
        self.tabBarController?.tabBar.isHidden = false
        
        //azis
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        refreshTable()
    }
    
    func refreshTable(){
        nearbyTableView.reloadData()
        
    }
    
    func setupNavBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
    }
    
    func setupLocation(){
        locationManager.locationDelegate = self
        locationManager.allowAccess()
        locationManager.checkCurrentLocation()
    }
    
    func setupRecommendView(){
        self.recommendView.layer.cornerRadius = 10
        self.recommendView.layer.masksToBounds = true
        self.inputPlace.layer.cornerRadius = self.inputPlace.frame.height * 0.25
        self.inputPlace.layer.masksToBounds = true
        
    }
    func reloadView() {
        self.title = locationManager.currentCity
        print(#function, locationManager.currentCity)
        nearbyTableView.reloadData()
    }
    
    @IBAction func inputPlaceAction(_ sender: Any) {
        let url = "https://airtable.com/shrLNuTBDOeqVjf62"
        performSegue(withIdentifier: "webViewSegue", sender: url)
    }
    
}

extension NearByControllerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPlaceCategory.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "articleTableViewCell") as! ArticleTableViewCell
            cell.articleDelegate = self
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            showRecommendedView()
            return cell
            
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "recomendedTableViewCell") as! RecomendedTableViewCell
            cell.recommendedDelegate = self
            cell.isDummy = isDummy
            if isChoosingCity {
                cell.buildUpCity(PlaceCategory: .store, city: self.title!)
            }
            else if locationManager.currentCity != nil{
                cell.buildUpView(PlaceCategory: .store)
            }
            showRecommendedView()
            return cell
        }else if indexPath.row == selectedPlaceCategory.count + 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputPlaceTableViewCell") as! InputPlaceTableViewCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width + 100 , bottom: 0, right: 0)
            hideRecommendedView()
            cell.inputPlaceDelegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "storeTableViewCell") as! StoreTableViewCell
            let currentIndex = indexPath.row - 2
            
            cell.delegate = self
            cell.isDummy = isDummy
            if isChoosingCity {
                cell.buildUpCity(PlaceCategory: selectedPlaceCategory[currentIndex], city: self.title!)

            }
            else if locationManager.currentCity != nil{
                cell.buildUpView(PlaceCategory: selectedPlaceCategory[currentIndex])
            }
            showRecommendedView()
            
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 205
        }else if indexPath.row == 1{
            return 280
        }else if indexPath.row == selectedPlaceCategory.count + 2{
            return 353
        }else{
            return 308
        }
    }
    
}

extension NearByControllerViewController: ArticleTableViewCellDelegate, StoreTableViewCellDelegate, RecommendedTableViewCellDelegate, InputPlaceTableViewCellDelegate {
    
    func didPressedInputPressedButton(url: String) {
        performSegue(withIdentifier: "webViewSegue", sender: url)
    }
    
    
    func reloadTableView(){
        print(#function)
//        nearbyTableView.reloadData()
    }
    
    func didSelectedRecommended(place: Place) {
        performSegue(withIdentifier: "placeDetail", sender: place)
    }
    
    
    func didSelectedPlace(place: Place) {
        performSegue(withIdentifier: "placeDetail", sender: place)
    }
    
    
    func didSelectedArticle(url: String) {
        performSegue(withIdentifier: "webViewSegue", sender: url)
    }
    
    func didSelectedPlaceCategory(category: PlaceCategory) {
        performSegue(withIdentifier: "seeAllByCategory", sender: category)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "webViewSegue" {
            let webViewController: WebViewController = segue.destination as! WebViewController
            
            webViewController.url = sender as! String
        }

        if segue.identifier == "placeDetail" {
            let placeDetailViewController: PlaceDetailViewController = segue.destination as! PlaceDetailViewController
            placeDetailViewController.currentPlace = sender as? Place
            
        }
        
        if segue.identifier == "newSearchLocation" {
            let nav = segue.destination as! UINavigationController
            let destinationVC = nav.topViewController as! SearchNewLocationViewController
            
            print(#function, "test")
            
            destinationVC.parsingDelegate = self
        }
        
        if segue.identifier == "seeAllByCategory" {
            let categoryVC = segue.destination as! PlaceCategoryController
            if let category: PlaceCategory = sender as? PlaceCategory {
                categoryVC.category = category
            }
        }
    }
}

extension NearByControllerViewController: parsingCityNameProtocol {
    @IBAction func changeLocationAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "newSearchLocation", sender: nil)
    }
    
    func parsingCityName(with name: String, isChoosingCity : Bool) {
        print(#function, name)
        self.isChoosingCity = isChoosingCity
        self.title = name
        nearbyTableView.reloadData()
    }
}

extension NearByControllerViewController{
    
    func hideRecommendedView(){
        let target = UIScreen.main.bounds.size.height + recommendView.frame.height
        UIView.animate(withDuration: 0.5) {
            self.recommendView.alpha = 0
            //self.recommendedView.isHidden = true
//            self.recommendView.transform.translatedBy(x: 18, y: target)
        }
    }
    
    func showRecommendedView(){
        UIView.animate(withDuration: 0.5) {
            self.recommendView.alpha = 1
            //self.recommendedView.isHidden = false
//            self.recommendView.transform.translatedBy(x: 18, y: CGFloat(self.recommendViewY))
        }
    }
}
