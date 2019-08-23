//
//  NearByControllerViewController.swift
//  Group9
//
//  Created by Faridho Luedfi on 21/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class NearByControllerViewController: UIViewController {
    
    @IBOutlet weak var storeCollection: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let wrapper = StoreCollectionView.instance
        wrapper.categoryName = "Bulk Store"
        
        storeCollection.addSubview(wrapper.wrapper!)
        
    }

}
