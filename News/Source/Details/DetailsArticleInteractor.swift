//
//  DetailsArticleInteractor.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation

class DetailsArticleInteractor: PresenterToInteractorDetailsArticleProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterDetailsArticleProtocol?
    var article: Article?
    
    func loadDetailArticle() {
        guard let article = self.article else { return }
        presenter?.sendDetailArticle(article: article)
    }
    
    
}
