//
//  WebViewController.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 25/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import WebKit

class WebViewController:UIViewController, WKNavigationDelegate{
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        webView = WKWebView(frame: self.view.frame)
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2117647059, green: 0.3843137255, blue: 0.168627451, alpha: 1)]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2671571672, green: 0.4517241716, blue: 0.221950233, alpha: 1)
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: self.url)!
        webView.load(URLRequest(url: url))
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    

//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
//    }
    
    
    
    
    
    
    
}
