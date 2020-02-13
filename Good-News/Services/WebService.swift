//
//  WebService.swift
//  Good-News
//
//  Created by Ashutosh Purushottam on 12/02/20.
//  Copyright © 2020 Ashutosh Purushottam. All rights reserved.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articles = try? JSONDecoder().decode(ArticleList.self, from: data).articles
                completion(articles)
            }
        }.resume()

    }
    
}
