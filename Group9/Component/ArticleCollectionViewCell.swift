//
//  ArticleCollectionViewCell.swift
//  Group9
//
//  Created by Azis Jabbar Susetio on 24/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var transparentView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var article: Article!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let article = article{
            articleLabel.text =  article.title
            articleImage.image = article.image
        }else{
            articleLabel.text =  article.title
            articleImage.image = article.image
        }
        
        transparentView?.layer.cornerRadius = 10.0
        transparentView?.layer.masksToBounds = true

        articleImage?.layer.cornerRadius = 10.0
        articleImage?.layer.masksToBounds = true
    }

}
