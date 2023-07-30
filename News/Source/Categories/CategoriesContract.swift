//
//  CategoriesContract.swift
//  News
//
//  Created by ITUMAC03 on 29/07/23.
//  
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCategoriesProtocol {
    func onGetCategorySuccess(category: [String])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCategoriesProtocol {
    
    var view: PresenterToViewCategoriesProtocol? { get set }
    var interactor: PresenterToInteractorCategoriesProtocol? { get set }
    var router: PresenterToRouterCategoriesProtocol? { get set }
    
    func viewDidLoad()
    func didSelectRowAt(index: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCategoriesProtocol {
    
    var presenter: InteractorToPresenterCategoriesProtocol? { get set }
    
    func loadCategory()
    func retrieveCategory(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCategoriesProtocol {
    func getDataCategorySuccess(category: [Category])
    func findCategorySuccess(_ category: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCategoriesProtocol {
    func navigateToSource(on view: PresenterToViewCategoriesProtocol, with category: String)
}
