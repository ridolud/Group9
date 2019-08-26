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
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: self.url)
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        webView = WKWebView(frame: self.view.frame)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isUserInteractionEnabled = true
        webView.navigationDelegate = self as? WKNavigationDelegate
        self.view.addSubview(self.webView)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // add loadingIndicator
        self.webView.addSubview(self.loadingIndicator)
        self.loadingIndicator.startAnimating()
        self.webView.navigationDelegate = self as? WKNavigationDelegate
        self.loadingIndicator.hidesWhenStopped = true
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingIndicator.stopAnimating()
    }
    
    
    
    
    
    
    
    
    
}
