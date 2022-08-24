//
//  TopHeadlinesResponse.swift
//  Newsly
//
//  Created by Michal Fereniec on 24/08/2022.
//

import Foundation

struct TopHeadlinesResponse: Decodable {
    let articles: [Article]
}
