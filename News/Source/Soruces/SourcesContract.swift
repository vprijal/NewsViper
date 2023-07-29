//
//  SourcesContract.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSourcesProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSourcesProtocol {
    
    var view: PresenterToViewSourcesProtocol? { get set }
    var interactor: PresenterToInteractorSourcesProtocol? { get set }
    var router: PresenterToRouterSourcesProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSourcesProtocol {
    
    var presenter: InteractorToPresenterSourcesProtocol? { get set }
    var category: String? {get set}
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSourcesProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSourcesProtocol {
    
}
