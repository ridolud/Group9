//
//  SignUpViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import CloudKit

class SignUpViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var conPassTF: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.isHidden = true
        customUIElement()
    }
    
    func customUIElement(){
        button.layer.cornerRadius = 12
    }
 
    @IBAction func signUpButton(_ sender: Any) {
        let name = nameTF.text!
        let email = emailTF.text!
        let phone = phoneTF.text!
        let location = locationTF.text!
        let pass = passTF.text!
        let conPass = conPassTF.text!
        if email.isEmpty == true || pass.isEmpty == true || name.isEmpty == true || phone.isEmpty == true || location.isEmpty == true || conPass.isEmpty == true{
            self.infoLabel.isHidden = false
            self.infoLabel.text = "All textfield must be filled"
        }else{
            if pass != conPass{
                self.infoLabel.isHidden = false
                self.infoLabel.text = "Password are not matching"
            }else{
                UserDefaults.standard.set("true", forKey: "hasLogin")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "nearByViewController") as! NearByControllerViewController
                self.navigationController?.pushViewController(newViewController, animated: false)
            }
        }
    }
    
    @IBAction func logInAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}
