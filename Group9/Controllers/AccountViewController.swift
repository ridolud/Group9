//
//  AccountViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SignInSegue"{
//            let destination = segue.destination as! SignInViewController
//            destination.delegate = self
//        }
        
//        if segue.identifier == "SignUpSegue"{
//            let destination = segue.destination as! SignUpViewController
//            destination.delegate = self
//        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "MyAcountSegue" {
            if currentUser() == nil{
//                accountButton.setTitle("Sign In", for: .normal)
                performSegue(withIdentifier: "SignInSegue", sender: self)
                return false
            }
        }
        return true
    }

}

//extension AccountViewController: SignInViewControllerDelegate{
////    func loginToRegister() {
////        performSegue(withIdentifier: "SignUpSegue", sender: self)
////    }
//    func registerToLogIn() {
//        performSegue(withIdentifier: "SignInSegue", sender: self)
//    }
//}
