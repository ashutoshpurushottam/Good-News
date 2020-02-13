//
//  ArticleList.swift
//  Good-News
//
//  Created by Ashutosh Purushottam on 12/02/20.
//  Copyright © 2020 Ashutosh Purushottam. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let author: String?
    let title: String
    let description: String
}
