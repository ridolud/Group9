//
//  OnboardingViewController.swift
//  Group9
//
//  Created by Willa on 28/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let cellID = "customCollectionViewID"
    
    var collectionViewData = OnboardingModel().fetchData()
    
    var currentIndex = 0
    
    var timer = Timer()
    
    
    
    @IBOutlet var collectionViewOutlet: UICollectionView!
    
    @IBOutlet var welcomeTextOutlet: UILabel!
    
    @IBOutlet var pageControlOutlet: UIPageControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        setupPageControl()
        setupCollectionView()
        setupCollectionViewLayout()
        
    }
    
    
    
    //MARK : - IBAction
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        print("sign in tapped")
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        print("register Now button tapped")
    }
    
    
    @IBAction func signInWithFacebookButtonTapped(_ sender: UIButton) {
        print("how to sell data with mark zuck")
    }
    
    @IBAction func signInWithGoogleButtonTapped(_ sender: Any) {
        print("i can see all of your photos in the google cloud photos")
    }
    
    
    @IBAction func skipAndContinueButtonTapped(_ sender: UIButton) {
        print("no one can be save, I will always track your location")
    }
    
    
    
    
    
    
    
    
    //MARK : - Function
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        let desiredScrollPosisiton = (currentIndex < collectionViewData.count - 1) ? currentIndex + 1 : 0
        
        collectionViewOutlet.scrollToItem(at: IndexPath(item: desiredScrollPosisiton, section: 0), at: .centeredHorizontally, animated: true)
        
    }
    
    
    
    func setupPageControl(){
        pageControlOutlet.numberOfPages = collectionViewData.count
    }
    
    func setupCollectionView(){
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
        let nib = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
        collectionViewOutlet.register(nib, forCellWithReuseIdentifier: cellID)
    }
    
    func setupCollectionViewLayout(){
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionViewLayout.itemSize = CGSize(width: 414, height: 344)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewOutlet.setCollectionViewLayout(collectionViewLayout, animated: true)
        
    }
    

    

}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.imageOutlet.image = UIImage(named: collectionViewData[indexPath.item].imageName ?? "onboarding-1")
        
        cell.textDescOutlet.text = collectionViewData[indexPath.item].descText
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / collectionViewOutlet.frame.width)
        pageControlOutlet.currentPage = currentIndex
        
        if currentIndex == 1{
            UIView.animate(withDuration: 0.5) {
                self.welcomeTextOutlet.isHidden = true
            }
        }
    }
    
    
    
    
    
}
