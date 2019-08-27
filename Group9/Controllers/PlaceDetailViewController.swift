//
//  PlaceDetailViewController.swift
//  Group9
//
//  Created by Ridwan Abdurrasyid on 22/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import MapKit
class PlaceDetailViewController: UIViewController, LocationManagerDelegate {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeTypeLabel: UILabel!
    @IBOutlet weak var placeTimeLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    @IBOutlet weak var directionButtonOutlet: UIButton!
    @IBOutlet weak var callButtonOutlet: UIButton!
    @IBOutlet weak var calendarButtonOutlet: UIButton!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    @IBOutlet weak var mapOutlet: MKMapView!
    @IBOutlet weak var reviewButtonOutlet: UIButton!
    @IBOutlet weak var similarPlaceView: UIView!
    
    var currentPlace: Place!
    
    var isFavorite = false
    var currentLocation : CLLocation?
    let locationManager = LocationManager.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        locationManager.allowAccess()
        locationManager.locationDelegate = self
        setupPlace()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .white
    }
    
    func setupPlace() {
        placeNameLabel.text = currentPlace.name
        placeTypeLabel.text = "Bulk Store"
        placeTimeLabel.text = "Monday - Sunday, 10AM - 10PM"
        placeAddressLabel.text = currentPlace.address
        locationManager.checkCurrentLocation(viewController: self)
    }

    func setupNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        setNeedsStatusBarAppearanceUpdate()
    }
    
//    func setupSimilarPlace(){
//        let wrapper = StoreCollectionView()
//        wrapper.backgroundColor = .white
//        wrapper.categoryName = "Similar Places"
//        similarPlaceView.addSubview(wrapper.wrapper!)
//        view.setNeedsLayout()
//    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func favoriteButtonHaptic(_ sender: UIButton) {
        let haptic = UINotificationFeedbackGenerator()
        haptic.notificationOccurred(.success)
    }
    
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        isFavorite = !isFavorite
        if isFavorite {
            favoriteButtonOutlet.setTitle("♥︎", for: .normal)
        } else {
            favoriteButtonOutlet.setTitle("♡", for: .normal)
        }
    }
    
    @IBAction func directionButtonAction(_ sender: Any) {
        
        let navigate = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let aMaps = UIAlertAction(title: "Navigate with Maps", style: .default) { _ in
            let coordinate = CLLocationCoordinate2DMake(40,40)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = "Target location"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        }
        let gMaps = UIAlertAction(title: "Navigate with Google Maps", style: .default) { _ in
            let testURL = URL(string: "comgooglemaps-x-callback://")
            if UIApplication.shared.canOpenURL(testURL!) {
                let directionRequest = "comgooglemaps-x-callback://" + "?daddr=\(40),\(40)&directionsmode=driving"
                UIApplication.shared.openURL(URL(string: directionRequest)!)
                
            } else {
                NSLog("Can't use comgooglemaps://");
            }
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
    
    func reloadView() {
        currentLocation = locationManager.currentLocation
        print(#function, currentLocation)
    }
    
}
