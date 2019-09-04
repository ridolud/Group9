//
//  ViewController.swift
//  onboardingTest
//
//  Created by Azis Jabbar Susetio on 03/09/19.
//  Copyright © 2019 Azis Susetio. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var onboardCollectionView: UICollectionView!
    @IBOutlet weak var onboardPageControl: UIPageControl!
    
    @IBOutlet weak var googleSignInBtn: UIButton!
    @IBOutlet weak var genericSIgnInBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var fbSignInBtn: UIButton!
    
    var onboards = Onboard.fetchData()
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onboardCollectionView.register(UINib(nibName: "OnboardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "onboardCollectionViewCell")
        
        // Do any additional setup after loading the view.
        onboardCollectionView.delegate = self
        onboardCollectionView.dataSource = self
        
        onboardPageControl.numberOfPages = onboards.count
        onboardPageControl.currentPage = 0
    
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardCollectionViewCell", for: indexPath) as! OnboardCollectionViewCell
        let onboard = onboards[indexPath.item]
        
        cell.onboard = onboard
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        onboardPageControl.currentPage = currentPage
    }
    
    @IBAction func skipAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "onboarding")
        print(#function, UserDefaults.standard.bool(forKey: "onboarding"))
    }
}

extension OnboardingViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (topView.frame.width)  , height: topView.frame.height)
    }
    
    
    
    
}

