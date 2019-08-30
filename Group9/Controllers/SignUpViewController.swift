//
//  SignUpViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import CloudKit

protocol SignUpViewControllerDelegate {
    func registerToLogIn()
}
class SignUpViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var conPassTF: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var delegate: SignUpViewControllerDelegate?
    
    let publicDatabase = CKContainer.default().publicCloudDatabase
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customUIElement()
    }
    
    func customUIElement(){
        button.layer.cornerRadius = 12
    }
    
//    func saveRecord(){
//        let userRecord = CKRecord(recordType: "User")
//        userRecord["name"] = nameTF.text! as NSString
//        userRecord["email"] = emailTF.text! as NSString
//        userRecord["phone"] = phoneTF.text! as NSString
//        userRecord["location"] = locationTF.text! as NSString
//        userRecord["password"] = passTF.text! as NSString
//        userRecord["confirmPassword"] = conPassTF.text! as NSString
//
//        publicDatabase.save(userRecord) {
//            (record, error) in
//            if let error = error {
//                print("LogErrorDB \(error)")
//                DispatchQueue.main.async {
//                    self.alert(message: "Failed : \(error)", title: "Error")
//                }
//                return
//            }
//            print("Data saved")
//            DispatchQueue.main.async {
//                self.alert(message: "Registered", title: "Alert")
//            }
//        }
//    }
    
    @IBAction func signUpButton(_ sender: Any) {
//        if nameTF.text!.isEmpty || emailTF.text!.isEmpty || phoneTF.text!.isEmpty || locationTF.text!.isEmpty || passTF.text!.isEmpty || conPassTF.text!.isEmpty{
//            DispatchQueue.main.async {
//                self.alert(message: "All text field must be filled", title: "Alert")
//            }
//        } else{
//            saveRecord()
//        }
//        self.navigationController?.popToRootViewController(animated: true)
        UserDefaults.standard.set("true", forKey: "hasLogin")
//        performSegue(withIdentifier: "DoneSignUpSegue", sender: self)
//        self.dismiss(animated: true, completion: nil)
        self.delegate?.registerToLogIn()
    }
    
    @IBAction func logInAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.registerToLogIn()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
