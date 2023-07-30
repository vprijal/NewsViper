//
//  ArticlesPresenter.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation

class ArticlesPresenter: ViewToPresenterArticlesProtocol {

    // MARK: Properties
    var view: PresenterToViewArticlesProtocol?
    var interactor: PresenterToInteractorArticlesProtocol?
    var router: PresenterToRouterArticlesProtocol?
    var articles: [Article] = []
    
    func viewDidLoad() {
        interactor?.loadArticle()
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveArticle(at: index)
    }
}

extension ArticlesPresenter: InteractorToPresenterArticlesProtocol {
    func fetchArticleSuccess(article: [Article]) {
        self.articles = article
        view?.onFetchArticleSuccess(article: article)
    }
    
    func findArticleSuccess(_ article: Article) {
        router?.navigateToDetailArticle(on: view!, with: article)
    }
}
