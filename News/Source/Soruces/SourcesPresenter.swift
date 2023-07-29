//
//  SourcesPresenter.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation

class SourcesPresenter: ViewToPresenterSourcesProtocol {

    // MARK: Properties
    var view: PresenterToViewSourcesProtocol?
    var interactor: PresenterToInteractorSourcesProtocol?
    var router: PresenterToRouterSourcesProtocol?
}

extension SourcesPresenter: InteractorToPresenterSourcesProtocol {
    
}
