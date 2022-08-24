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
        
        guard let articleUrl = article?.url else { return }
        guard let url = URL(string: articleUrl) else { return }
        
        articleWebView.load(URLRequest(url: url))
    }
}
