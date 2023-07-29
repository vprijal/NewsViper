//
//  CategoriesInteractor.swift
//  News
//
//  Created by ITUMAC03 on 29/07/23.
//  
//

import Foundation

class CategoriesInteractor: PresenterToInteractorCategoriesProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterCategoriesProtocol?
    var category: [Category]?
    
    func loadCategory() {
        let data = CategoryResponse.DataCategory()
        self.category?.append(contentsOf: data.category)
        self.presenter?.getDataCategorySuccess(category: data.category)
    }
}
