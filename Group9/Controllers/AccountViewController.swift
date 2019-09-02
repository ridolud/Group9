//
//  AccountViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        distanceSlider.value = Float(UserDefaults.standard.integer(forKey: "distance"))
        distanceLabel.text = String(Int(distanceSlider.value)) + " km"
        setupNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(Float(distanceSlider.value), forKey: "distance")
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
    
    
    
    @IBAction func distanceSliderAction(_ sender: Any) {
        distanceLabel.text = String(Int(distanceSlider.value)) + " km"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell")
        cell?.selectionStyle = .none
        switch indexPath.row {
        case 0 : cell?.textLabel?.text = "My Account"
        case 1 : cell?.textLabel?.text = "Favorites"
        case 2 : cell?.textLabel?.text = "About Us"
        default : cell?.textLabel?.text = ""
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            if UserDefaults.standard.string(forKey: "hasLogin") == "true" {
            performSegue(withIdentifier: "myAccountSegue", sender: self)
        }else{
            performSegue(withIdentifier: "SignInSegue", sender: self)
            }
        case 1 : performSegue(withIdentifier: "favorites", sender: self)
        case 2 : break
        default : break
        }
    }
}
