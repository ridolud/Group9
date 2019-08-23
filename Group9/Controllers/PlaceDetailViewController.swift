//
//  PlaceDetailViewController.swift
//  Group9
//
//  Created by Ridwan Abdurrasyid on 22/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import MapKit
class PlaceDetailViewController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeTypeLabel: UILabel!
    @IBOutlet weak var placeTimeLabel: UILabel!
    @IBOutlet weak var directionButtonOutlet: UIButton!
    @IBOutlet weak var callButtonOutlet: UIButton!
    @IBOutlet weak var calendarButtonOutlet: UIButton!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    @IBOutlet weak var mapOutlet: MKMapView!
    @IBOutlet weak var reviewButtonOutlet: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var isFavorite = false
    var currentLocation : CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupPlace()
    }
    
    func setupPlace(){
        placeNameLabel.text = "Lulu Hypermart"
        placeTypeLabel.text = "Bulk Store"
        placeTimeLabel.text = "Monday - Sunday, 10AM - 10PM"
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Test"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
    }
    
    @IBAction func directionButtonAction(_ sender: Any) {
        let navigate = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let aMaps = UIAlertAction(title: "Navigate with Maps", style: .default) { _ in
            
        }
        let gMaps = UIAlertAction(title: "Navigate with Google Maps", style: .default) { _ in
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        navigate.addAction(aMaps)
        navigate.addAction(gMaps)
        navigate.addAction(cancel)
        self.present(navigate, animated: true, completion: nil)
    }
    
    @IBAction func callButtonAction(_ sender: Any) {
        print(#function)
        let num = "082325014153"
        guard let number = URL(string: "tel://" + num) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func callendarButtonAction(_ sender: Any) {
    }
    
    @IBAction func reviewButtonAction(_ sender: Any) {
    }
    
    
    
}
