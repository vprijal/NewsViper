//
//  DetailsArticlePresenter.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation

class DetailsArticlePresenter: ViewToPresenterDetailsArticleProtocol {

    // MARK: Properties
    var view: PresenterToViewDetailsArticleProtocol?
    var interactor: PresenterToInteractorDetailsArticleProtocol?
    var router: PresenterToRouterDetailsArticleProtocol?
    
    func viewDidLoad() {
        interactor?.loadDetailArticle()
    }
}

extension DetailsArticlePresenter: InteractorToPresenterDetailsArticleProtocol {
    func sendDetailArticle(article: Article) {
        view?.onSendArticleSuccess(article: article)
    }
}
