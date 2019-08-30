//
//  SignInViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import CloudKit

class SignInViewController: UIViewController, UINavigationControllerDelegate {
   
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.isHidden = true
        setupNavigationBar()
        customUIElement()
    }
    
    func customUIElement(){
        button.layer.cornerRadius = 12

    }

    func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
    }
    
    @IBAction func logInButton(_ sender: Any) {
        let email = emailTF.text!
        let password = passTF.text!
        if email.isEmpty == true || password.isEmpty == true{
            self.infoLabel.isHidden = false
            self.infoLabel.text = "Invalid/missing email ID or password"
        } else{
            if emailTF.text == "guest123@gmail.com" && passTF.text == "guest" {
                UserDefaults.standard.set("true", forKey: "hasLogin")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "nearByViewController") as! NearByControllerViewController
                self.navigationController?.pushViewController(newViewController, animated: false)
            }
            
        }
    }

    @IBAction func registerAction(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}
