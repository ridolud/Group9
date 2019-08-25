//
//  WebViewController.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 25/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import WebKit

class WebViewController:UIViewController{
    @IBOutlet weak var webView: WKWebView!
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: self.url)
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        
    }
    
    
}
