//
//  TestViewController.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 29/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recommendedView: UIView!
    @IBOutlet weak var inputPlace: UIButton!
    let recommendedViewY = 809
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        roundRecommendedView()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func roundRecommendedView(){
        self.recommendedView.layer.cornerRadius = 10
        self.recommendedView.layer.masksToBounds = true
        self.inputPlace.layer.cornerRadius = self.inputPlace.frame.height * 0.5
        self.inputPlace.layer.masksToBounds = true
    }
    
    @IBAction func inputPlace(_ sender: Any) {
        let url = ""
        performSegue(withIdentifier: "webViewSegue", sender: url)
    }
    
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("offset y = \(tableView.contentOffset.y)")
        print("content size height = \(tableView.contentSize.height)")
        print("frame size height = \(tableView.frame.size.height)")
        
        
        if indexPath.row == 49{
            
            let cell = Bundle.main.loadNibNamed("InputPlaceTableViewCell", owner: self, options: nil)?.first as! UITableViewCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width + 100 , bottom: 0, right: 0)
            hideRecommendedView()
            return cell
        }
        else{
            let cell = Bundle.main.loadNibNamed("TestTableViewCell", owner: self, options: nil)?.first as! UITableViewCell
            if indexPath.row < 32 {
                showRecommendedView()
            }
            //showRecommendedView()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 49{
            return 353
        }else{
           
            return 50
        }
    }
    
    
    

    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height) {
            //hideRecommendedView()
        }else
        {
            //showRecommendedView()
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height) {
            //hideRecommendedView()
        }else{
            //showRecommendedView()
        }
    }
    
    
    
    
}

extension TestViewController{
    
    func hideRecommendedView(){
        let target = UIScreen.main.bounds.size.height + recommendedView.frame.height
        UIView.animate(withDuration: 0.5) {
            self.recommendedView.alpha = 0
            //self.recommendedView.isHidden = true
            self.recommendedView.transform.translatedBy(x: 18, y: target)
        }
        
    }
    
    func showRecommendedView(){
        UIView.animate(withDuration: 0.5) {
            self.recommendedView.alpha = 1
            //self.recommendedView.isHidden = false
            self.recommendedView.transform.translatedBy(x: 18, y: CGFloat(self.recommendedViewY))
        }
    }
}
