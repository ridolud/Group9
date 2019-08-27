//
//  SignInViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
   
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customUIElement()
    }
    
    func customUIElement(){
        emailTF.frame.size.height = 48
        passTF.frame.size.height = 48
        button.layer.cornerRadius = 12
    }

}
