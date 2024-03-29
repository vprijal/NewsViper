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
    var source: [Source] = []
    
    func viewDidLoad() {
        interactor?.loadSource()
    }
    
    func didSelectRowAt(id: String) {
        interactor?.retrieveSources(id: id)
    }
}

extension SourcesPresenter: InteractorToPresenterSourcesProtocol {
    func fetchSourceSuccess(source: [Source]) {
        self.source = source
        view?.onFetchSourceSuccess(source: source)
    }
    
    func fetchSourceFailure() {
        view?.onFetchSourceFailure()
    }
    
    func findSourcesSuccess(_ sourceId: String) {
        router?.navigateToArticle(on: view!, with: sourceId)
    }
}
