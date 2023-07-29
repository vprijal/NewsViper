//
//  CategoriesPresenter.swift
//  News
//
//  Created by ITUMAC03 on 29/07/23.
//  
//

import Foundation

class CategoriesPresenter: ViewToPresenterCategoriesProtocol {

    // MARK: Properties
    var view: PresenterToViewCategoriesProtocol?
    var interactor: PresenterToInteractorCategoriesProtocol?
    var router: PresenterToRouterCategoriesProtocol?
    var category: [String] = []
    
    func viewDidLoad() {
        interactor?.loadCategory()
    }
}

extension CategoriesPresenter: InteractorToPresenterCategoriesProtocol {
    func getDataCategorySuccess(category: [Category]) {
        self.category = category.compactMap({$0.name})
        view?.onGetCategorySuccess(category: self.category)
    }
}
