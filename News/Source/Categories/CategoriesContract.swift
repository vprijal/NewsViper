//
//  CategoriesContract.swift
//  News
//
//  Created by ITUMAC03 on 29/07/23.
//  
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCategoriesProtocol: class {
    func onGetCategorySuccess(category: [String])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCategoriesProtocol {
    
    var view: PresenterToViewCategoriesProtocol? { get set }
    var interactor: PresenterToInteractorCategoriesProtocol? { get set }
    var router: PresenterToRouterCategoriesProtocol? { get set }
    
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCategoriesProtocol {
    
    var presenter: InteractorToPresenterCategoriesProtocol? { get set }
    
    func loadCategory()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCategoriesProtocol {
    func getDataCategorySuccess(category: [Category])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCategoriesProtocol {
    
}
