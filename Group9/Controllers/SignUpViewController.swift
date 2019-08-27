//
//  SignUpViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var conPassTF: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customUIElement()
    }
    
    func customUIElement(){
        nameTF.frame.size.height = 48
        emailTF.frame.size.height = 48
        phoneTF.frame.size.height = 48
        passTF.frame.size.height = 48
        conPassTF.frame.size.height = 48
        button.layer.cornerRadius = 12
    }

}
