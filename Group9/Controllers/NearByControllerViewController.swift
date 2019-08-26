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
        self.nearbyTableView.register(UINib.init(nibName: "RecomendedTableViewCell", bundle: nil), forCellReuseIdentifier: "recomendedTableViewCell")
        
        nearbyTableView.delegate = self
        
        
        //azis
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
        
        
    
        //ridho
//        let wrapper = StoreCollectionView.instance
//        wrapper.categoryName = "Bulk Store"
        //storeCollection.addSubview(wrapper.wrapper!)
        
        
    }
    
    
    
    

}


extension NearByControllerViewController: UITableViewDataSource, UITableViewDelegate, ArticleTableViewCellDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: self, options: nil)?.first as! ArticleTableViewCell
            
            cell.articleDelegate = self
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            
            return cell
        }else if indexPath.row == 1{
            let cell = Bundle.main.loadNibNamed("RecomendedTableViewCell", owner: self, options: nil)?.first as! UITableViewCell
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 205
        }else if indexPath.row == 1{
            return 280
        }else{
            return 100
        }
    }
    
    func didSelectedArticle(url: String) {
        
        performSegue(withIdentifier: "webViewSegue", sender: url)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webViewSegue" {
            let viewController: WebViewController = segue.destination as! WebViewController
            
            viewController.url = sender as! String

        }
    }
    
    
    
}


