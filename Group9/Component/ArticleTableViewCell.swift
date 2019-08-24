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
    

    override func awakeFromNib() {
        super.awakeFromNib()
    self.articleCollectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "articleCollectionViewCell")
        
        articleCollectionView.delegate = self
        articleCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
}
