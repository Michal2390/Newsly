//
//  ArticleViewController.swift
//  Newsly
//
//  Created by Michal Fereniec on 24/08/2022.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    
    @IBOutlet weak var articleWebView: WKWebView!
    
    var article: Article?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let articleUrl = article?.url, let url = URL(string: articleUrl) {
            let request = URLRequest(url: url)
            
            articleWebView.load(request)
        }
        
        
    }
}
