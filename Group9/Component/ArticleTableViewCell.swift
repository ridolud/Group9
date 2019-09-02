//
//  ArticleTableViewCell.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell, UICollectionViewDelegate {
    
    @IBOutlet weak var articleCollectionView: UICollectionView!
    @IBOutlet weak var articlePageControl: UIPageControl!
    
    
    
    let cell = 1 //cell id
    var articles = Article.fetchArticle()
    var currentPage = 0
    var timer = Timer()
    var link = ""
    
    var articleDelegate: ArticleTableViewCellDelegate?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.articleCollectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "articleCollectionViewCell")
        
        articleCollectionView.delegate = self
        articleCollectionView.dataSource = self
        
        articlePageControl.numberOfPages = articles.count
        articlePageControl.currentPage = 0
        
        
        //articleCollectionView.
        
//        articleCollectionView.layer.masksToBounds = true
//        articleCollectionView.layer.cornerRadius = 10.0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        } //change article automatically
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func changeImage(){
        if currentPage < articles.count {
            let index = IndexPath.init(item: currentPage, section: 0)
            self.articleCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            articlePageControl.currentPage = currentPage
            currentPage += 1
        }else {
            currentPage = 0
            let index = IndexPath.init(item: currentPage, section: 0)
            self.articleCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            articlePageControl.currentPage = currentPage
            
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        articlePageControl.currentPage = currentPage
    }
    
    
    
}

extension ArticleTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
        
        let article = articles[indexPath.item]
        
        
        cell.article = article
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.item]
        let url = article.link
        
        articleDelegate?.didSelectedArticle(url: url)
    }
    
    
    
}

@objc protocol ArticleTableViewCellDelegate {
    @objc func didSelectedArticle(url: String)
}
