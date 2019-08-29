//
//  SignInViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import CloudKit

//protocol SignInViewControllerDelegate: class {
//    func loginToRegister()
//}

class SignInViewController: UIViewController, UINavigationControllerDelegate {
   
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    let publicDatabase = CKContainer.default().publicCloudDatabase
//    weak var delegate: SignInViewControllerDelegate?
    var isNotRegistered = true

    var userRecords = [CKRecord]()
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.isHidden = true
        setupNavigationBar()
//        retrieve()
        customUIElement()
    }
    
    func customUIElement(){
//        emailTF.frame.size.height = 48
//        passTF.frame.size.height = 48
        button.layer.cornerRadius = 12

    }

//    func retrieve(){
//        let query = CKQuery(recordType: "UserData", predicate: NSPredicate(value: true))
//        
//        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
//            guard let records = records else {return} //Guard pasti return
//            let sortRecords = records.sorted(by: {$0.creationDate! > $1.creationDate!})
//            //            self.userRecords = sortRecords
//            //            print(self.userRecords)
//            
//            for record in sortRecords{
//                self.users.append(User(record: record))
//            }
//        }
//    }
    
//    func checkEmailRegistered(email: String) {
//        let predicate = NSPredicate(format: "email ==%@", email)
//        let query = CKQuery(recordType: "User" , predicate: predicate)
//        
//        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                guard let records = records else {return}
//                if records.count > 0 {
//                    print("record count \(records.count), false")
//                    self.isNotRegistered = false
//                } else {
//                    print("record = 0, true")
//                    self.isNotRegistered = true
//                }
//                self.login()
//            }
//        }
//    }
//    
//    
//    func login (){
//        let email = emailTF.text!
//        let password = passTF.text!
//        if (isNotRegistered){
//            DispatchQueue.main.async {
//                self.infoLabel.isHidden = false
//                self.infoLabel.text = "Email Unregistered"
//            }
//        } else {
//            
//            for user in users{
//                if email == user.email! {
//                    
//                    if password == user.password! {
//                        DispatchQueue.main.async {
//                            self.infoLabel.text = "Login Success"
//                            self.performSegue(withIdentifier: "myAccount", sender: self)
//                        }
//                        print("break...")
//                    } else {
//                        DispatchQueue.main.async {
//                            self.infoLabel.text = "Wrong Password"
//                        }
//                    }
//                    break
//                }
//            }
//        }
//    }
//    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
    }
    
    @IBAction func logInButton(_ sender: Any) {
//        checkEmailRegistered(email: emailTF.text!)
        UserDefaults.standard.set("true", forKey: "hasLogin")
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func registerAction(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//        delegate?.loginToRegister()
    }
    @IBAction func cancelButton(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
    }
}
