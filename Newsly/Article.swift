//
//  Article.swift
//  Newsly
//
//  Created by Michal Fereniec on 23/08/2022.
//

import Foundation

struct Article: Decodable {
    let headline: String
    let urlToImage: String?
    
    private enum CodingKeys: String, CodingKey{
        case headline = "title"
        case urlToImage
    }
}
