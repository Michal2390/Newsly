//
//  NewsViewController.swift
//  Newsly
//
//  Created by Michal Fereniec on 22/08/2022.
//

import UIKit

class NewsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var articles = [
        Article(headline: "This is news"),
        Article(headline: "This is news2"),
        Article(headline: "This is news3")
    ]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
        
        let article = articles[indexPath.item]
        cell.populate(with: article)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 240
        let width = (collectionView.frame.width / 2) - 2
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
}
