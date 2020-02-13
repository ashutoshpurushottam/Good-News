//
//  NewsListViewController.swift
//  Good-News
//
//  Created by Ashutosh Purushottam on 12/02/20.
//  Copyright © 2020 Ashutosh Purushottam. All rights reserved.
//

import UIKit

class NewsListViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        fetchArticles()
    }
    
    private func setUp() {
        // Large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        // Title color
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        // navbar color
        navBarAppearance.backgroundColor = UIColor.init(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func fetchArticles() {
        // URL
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d887522a112941729210989425b990c3")!
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("cell identifier is not proper")
        }

        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.authorLabel.text = articleViewModel.author
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        
        return cell
    }
    
}
