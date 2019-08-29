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
    @IBOutlet weak var similarPlaceView: UITableView!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    var currentPlace: Place!
    
    var isFavorite = false
    var currentLocation : CLLocation?
    let locationManager = LocationManager.instance
    let store = EKEventStore()
    var event : EKEvent?
    var distance = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlace()
        setupMap()
        setupSimilarPlace()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupNavigationBarCancel()
    }
    func setupPlace() {
        placeNameLabel.text = currentPlace.name
        placeTypeLabel.text = currentPlace.category.description
        placeTimeLabel.text = "Monday - Sunday, 10AM - 10PM"

        currentLocation = locationManager.currentLocation
        distance = Int((currentLocation?.distance(from: currentPlace.location!))!)
        placeAddressLabel.text = "\(distance/1000) km, \(currentPlace.address)"
        
        imageOutlet.loadFromUrl(currentPlace.featureImgUrl)
    }
    
    func setupMap(){
        let annotation = MKPointAnnotation()
        annotation.coordinate = currentPlace.location!.coordinate
        annotation.title = currentPlace.name
        let regionRadius :CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: currentPlace.location!.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapOutlet.setRegion(coordinateRegion, animated: true)
        mapOutlet.showsUserLocation = true
        mapOutlet.addAnnotation(annotation)
    }
    
    func setupSimilarPlace(){
        similarPlaceView.register(UINib.init(nibName: "StoreTableViewCell", bundle: nil), forCellReuseIdentifier: "storeTableViewCell")
        similarPlaceView.delegate = self
        similarPlaceView.dataSource = self
    }

    func setupNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.view.backgroundColor = .clear
        setNeedsStatusBarAppearanceUpdate()
    }
    func setupNavigationBarCancel(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.view.backgroundColor = .white
        setNeedsStatusBarAppearanceUpdate()
    }

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
            let coordinate = self.currentPlace.location!.coordinate
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = "Target location"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        }
        let gMaps = UIAlertAction(title: "Navigate with Google Maps", style: .default) { _ in
            let testURL = URL(string: "comgooglemaps-x-callback://")
            if UIApplication.shared.canOpenURL(testURL!) {
                let directionRequest = "comgooglemaps-x-callback://" + "?daddr=\(self.currentPlace.location!.coordinate.latitude),\(self.currentPlace.location!.coordinate.longitude)&directionsmode=driving"
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
    
    @IBAction func calendarButtonAction(_ sender: Any) {
        addEventView()
    }
    
    @IBAction func reviewButtonAction(_ sender: Any) {
    }
}

import EventKitUI
extension PlaceDetailViewController : EKEventEditViewDelegate{
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        switch action {
        case .canceled:
            dismiss(animated: true, completion: nil)
        default:
            do{
                try store.save(event!, span: .thisEvent)
                dismiss(animated: true, completion: nil)
            }catch{
                print("error save")
            }
        }
    }
    
    func addEventView(){
        let vc = EKEventEditViewController()
        vc.editViewDelegate = self
        vc.eventStore = store
        vc.event = EKEvent(eventStore: store)
        vc.event?.location = "Jakarta"
        let structuredLocation = EKStructuredLocation(title: currentPlace.name)
        structuredLocation.geoLocation = currentPlace.location
        vc.event!.structuredLocation = structuredLocation
        event = vc.event
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            self.present(vc, animated: true, completion: nil)
        case .denied:
            print("Access denied")
        case .notDetermined:
            store.requestAccess(to: .event, completion:
                {(granted: Bool, error: Error?) -> Void in
                    if granted {
                        self.present(vc, animated: true, completion: nil)
                    } else {
                        print("Access denied")
                    }
            })
        default:
            print("Case default")
        }
    }
}

extension PlaceDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StoreTableViewCell", owner: self, options: nil)?.first as! StoreTableViewCell
        
        cell.delegate = self
        cell.buildUpSimilar(PlaceCategory: currentPlace.category)
//        cell.seeAllButtonOutlet.isHidden = true
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 308
    }
}


extension PlaceDetailViewController: StoreTableViewCellDelegate{
    func reloadTableView() {
//        similarPlaceView.reloadData()
    }
    
    
    func didSelectedPlaceCategory(category: PlaceCategory) {
        performSegue(withIdentifier: "seeAllByCategory", sender: category)

    }
    
    
    func didSelectedPlaceCategory(category: PlaceCategory) {
        //
    }
    
    
    func didSelectedPlace(place: Place) {
        performSegue(withIdentifier: "placeDetail", sender: place)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "placeDetail" {
            let placeDetailViewController: PlaceDetailViewController = segue.destination as! PlaceDetailViewController
            placeDetailViewController.currentPlace = sender as? Place
            
        }
        if segue.identifier == "seeAllByCategory" {
            let destinationVC: PlaceCategoryController = segue.destination as! PlaceCategoryController
            if let category: PlaceCategory = sender as? PlaceCategory {
                destinationVC.category = category
            }
        }
        
    }
}
