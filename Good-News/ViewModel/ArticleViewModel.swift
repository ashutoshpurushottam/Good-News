//
//  ArticleViewModel.swift
//  Good-News
//
//  Created by Ashutosh Purushottam on 12/02/20.
//  Copyright © 2020 Ashutosh Purushottam. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var author: String {
        return self.article.author ?? "Staff"
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
