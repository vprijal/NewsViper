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
}

extension SourcesPresenter: InteractorToPresenterSourcesProtocol {
    func fetchSourceSuccess(source: [Source]) {
        self.source = source
        view?.onFetchSourceSuccess(source: source)
    }
}
