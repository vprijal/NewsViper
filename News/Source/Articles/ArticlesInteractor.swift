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
}
