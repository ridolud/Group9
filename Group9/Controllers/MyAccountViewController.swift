//
//  MyAccountViewController.swift
//  Group9
//
//  Created by Jasmine Hanifa Mounir on 27/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewDOB: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var button: UIButton!
    
    var user: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        customUIComponent()
    }
    
    func customUIComponent(){
        viewName.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.6470080018, green: 0.6470875144, blue: 0.6469809413, alpha: 1), width: 1.0)
        viewEmail.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.6470080018, green: 0.6470875144, blue: 0.6469809413, alpha: 1), width: 1.0)
        viewDOB.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.6470080018, green: 0.6470875144, blue: 0.6469809413, alpha: 1), width: 1.0)
        viewPhone.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.6470080018, green: 0.6470875144, blue: 0.6469809413, alpha: 1), width: 1.0)
        viewLocation.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.6470080018, green: 0.6470875144, blue: 0.6469809413, alpha: 1), width: 1.0)
        button.layer.cornerRadius = 12
        profilePicture.layer.cornerRadius = profilePicture.frame.height/2
    }
    
    func loadData(){
        profilePicture.image = #imageLiteral(resourceName: "dummyPhoto")
        name.text = "Richard"
        email.text = "guest123@gmail.com"
        dob.text = "1993/11/20"
        phone.text = "084587736629"
        location.text = "Jakarta"
        
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "nearByViewController") as! NearByControllerViewController
        self.navigationController?.pushViewController(newViewController, animated: false)
        UserDefaults.standard.set("false", forKey: "hasLogin")
       
    }
    
    
   
}
