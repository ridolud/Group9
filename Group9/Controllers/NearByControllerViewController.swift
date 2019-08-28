//
//  NearByControllerViewController.swift
//  Group9
//
//  Created by Faridho Luedfi on 21/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit


class NearByControllerViewController: UIViewController {
    
    @IBOutlet weak var nearbyTableView: UITableView!
    
    let selectedPlaceCategory: [PlaceCategory] = [.store, .repair, .refill]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.nearbyTableView.register(UINib.init(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "articleTableViewCell")
        self.nearbyTableView.register(UINib.init(nibName: "RecomendedTableViewCell", bundle: nil), forCellReuseIdentifier: "recomendedTableViewCell")
        
        nearbyTableView.delegate = self
        self.tabBarController?.tabBar.isHidden = false
        
        
        
        //azis
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
    }
    

    
}

extension NearByControllerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPlaceCategory.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: self, options: nil)?.first as! ArticleTableViewCell
            
            cell.articleDelegate = self
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            
            return cell
        }else if indexPath.row == 1{
            let cell = Bundle.main.loadNibNamed("RecomendedTableViewCell", owner: self, options: nil)?.first as! UITableViewCell
            
            return cell
        }else{
            let cell = Bundle.main.loadNibNamed("StoreTableViewCell", owner: self, options: nil)?.first as! StoreTableViewCell
            let currentIndex = indexPath.row - 2
            
            cell.delegate = self
            cell.buildUpView(PlaceCategory: selectedPlaceCategory[currentIndex])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 205
        }else if indexPath.row == 1{
            return 280
        }else{
            return 308
        }
    }
    
}

extension NearByControllerViewController: ArticleTableViewCellDelegate, StoreTableViewCellDelegate {
    
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
    
    @IBAction func checngeLocationAction(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "newSearchLocation", sender: nil)
        
    }
    
    func parsingCityName(with name: String, isFromSearchVC: Bool) {
        print(#function, name)
        
        self.title = name
    }
    
    
    
    
}


