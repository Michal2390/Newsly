//
//  ArticleCell.swift
//  Newsly
//
//  Created by Michal Fereniec on 23/08/2022.
//

import UIKit
import Kingfisher

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headlineLabel.text?.removeAll()
        articleImageView.image = nil
    }
    
    func populate(with article: Article) {
        headlineLabel.text = article.headline
        
        //cache-ing photos from the internet
        if let urlToImage = article.urlToImage {
            let url = URL(string: urlToImage)
            articleImageView.kf.setImage(with: url)
        }
    }
}
