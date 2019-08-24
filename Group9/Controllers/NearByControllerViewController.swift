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
    @IBOutlet weak var nearbyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.nearbyTableView.register(UINib.init(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "articleTableViewCell")
        nearbyTableView.delegate = self
        //azis
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    
        
        
        //ridho
//        let wrapper = StoreCollectionView.instance
//        wrapper.categoryName = "Bulk Store"
        //storeCollection.addSubview(wrapper.wrapper!)
        
        
    }

}


extension NearByControllerViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            let cell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: self, options: nil)?.first as! UITableViewCell
            return cell
        }else{
            let cell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: self, options: nil)?.first as! UITableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1{
            return 205
        }else{
            return 205
        }
    }
    
    
    
    
}
