//
//  MainTabBarController.swift
//  Group9
//
//  Created by Faridho Luedfi on 20/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let item1 = NearByController()
        let tabItem1 = UITabBarItem(title: "Near By", image: nil, tag: 1)
        item1.tabBarItem = tabItem1
        
        let item2 = SearchController()
        let tabItem2 = UITabBarItem(title: "Search", image: nil, tag: 1)
        item2.tabBarItem = tabItem2
        
        let item3 = ProfileController()
        let tabItem3 = UITabBarItem(title: "Profile", image: nil, tag: 1)
        item3.tabBarItem = tabItem3
        
        self.viewControllers = [item1, item2, item3]
    }
    
    /*
    // Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
    */
    
    

}
