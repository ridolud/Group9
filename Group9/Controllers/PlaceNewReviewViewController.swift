//
//  PlaceNewReviewViewController.swift
//  Group9
//
//  Created by Ridwan Abdurrasyid on 25/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class PlaceNewReviewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButtoneOutlet: UIBarButtonItem!
    
    var place : Place?
    var reviewCategoryArr = ["Item Variety", "Cleanliness","Price","Hospitality",]
    var reviewScore = [0,0,0,0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        for i in 0...4{
            let index = IndexPath(row: i, section: 0)
            if let cell =  tableView.cellForRow(at: index) as? StarTableViewCell {
                reviewScore[i] = cell.score
            }
        }
        saveReview()
        dismiss(animated: true, completion: nil)
    }
    
    func saveReview(){
        print(reviewScore)
    }
}

extension PlaceNewReviewViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StarTableViewCell", bundle: nil), forCellReuseIdentifier: "starTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewCategoryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starTableViewCell", for:  indexPath) as! StarTableViewCell
        cell.reviewCategoryLabel.text = reviewCategoryArr[indexPath.row]
        return cell
    }
    
    
}
