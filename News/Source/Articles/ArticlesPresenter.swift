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
}

extension ArticlesPresenter: InteractorToPresenterArticlesProtocol {
    
}
