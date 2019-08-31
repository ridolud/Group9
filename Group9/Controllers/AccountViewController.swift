//
//  AccountViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
    }
    
    @IBAction func accountAction(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "hasLogin") == "true" {
            performSegue(withIdentifier: "myAccountSegue", sender: self)
        }else{
            performSegue(withIdentifier: "SignInSegue", sender: self)
        }
    }
}
