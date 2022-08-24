//
//  NewsViewController.swift
//  Newsly
//
//  Created by Michal Fereniec on 22/08/2022.
//

import UIKit
import Alamofire
import Kingfisher

//d36bb4dd2a9249b5b3a797f3cbebc281
//https://newsapi.org/v2/everything

class NewsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()
    }
    
    func getArticles() {
        let parameters: Parameters = [
            "country": "us",
            "apikey": "d36bb4dd2a9249b5b3a797f3cbebc281"
        ]
        
        Alamofire.request("https://newsapi.org/v2/top-headlines", parameters: parameters).responseData { (response) in
            guard let data = response.data else { return }
            do {
                let topHeadlinesResponse = try JSONDecoder().decode(TopHeadlinesResponse.self, from: data)
                self.articles = topHeadlinesResponse.articles
                self.collectionView?.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
        
        cell.populate(with: articles[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 240.0
        let width = (collectionView.frame.width / 2) - 2
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.item]
        performSegue(withIdentifier: "swegue.Main.newsToArticle", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let articleVC = segue.destination as? ArticleViewController, let article = sender as? Article {
            articleVC.article = article
        }
    }
}
