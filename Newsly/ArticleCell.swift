//
//  ArticleCell.swift
//  Newsly
//
//  Created by Michal Fereniec on 23/08/2022.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    func populate(with article: Article) {
        headlineLabel.text = article.headline
//        articleImageView.image = UIImage(systemName: "home")
    }
}
