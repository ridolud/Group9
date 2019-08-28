//
//  PlaceCategoryController.swift
//  Group9
//
//  Created by Faridho Luedfi on 28/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class PlaceCategoryController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StoreListTableViewCell", owner: self, options: nil)?.first as! StoreListTableViewCell
        
        return cell
    }

}
