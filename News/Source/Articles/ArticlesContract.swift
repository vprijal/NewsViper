//
//  ArticlesContract.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewArticlesProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterArticlesProtocol {
    
    var view: PresenterToViewArticlesProtocol? { get set }
    var interactor: PresenterToInteractorArticlesProtocol? { get set }
    var router: PresenterToRouterArticlesProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorArticlesProtocol {
    
    var presenter: InteractorToPresenterArticlesProtocol? { get set }
    var sourceID: String? {get set}
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterArticlesProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterArticlesProtocol {
    
}
