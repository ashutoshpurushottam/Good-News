//
//  ArticleListViewModel.swift
//  Good-News
//
//  Created by Ashutosh Purushottam on 12/02/20.
//  Copyright © 2020 Ashutosh Purushottam. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    private let articles: [Article]
    
    init(_ articles: [Article]) {
        self.articles = articles
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        return ArticleViewModel(self.articles[index])
    }
    
}
