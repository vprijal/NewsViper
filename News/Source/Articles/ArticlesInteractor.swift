//
//  ArticlesInteractor.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation

class ArticlesInteractor: PresenterToInteractorArticlesProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterArticlesProtocol?
    var sourceID: String?
    var network: NetworkManager = NetworkManager.shared
    var article: [Article]?
    
    func loadArticle() {
        network.request(route: .article(id: sourceID ?? "")) { (result: Result<ArticleResponse?, Error>) in
            switch result {
            case .success(let response):
                self.article = response?.articles
                self.presenter?.fetchArticleSuccess(article: response?.articles ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func retrieveArticle(at index: Int) {
        guard let article = self.article, article.indices.contains(index) else {
            return
        }
        self.presenter?.findArticleSuccess(article[index])
    }
}
