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
    func onFetchSourceSuccess(source: [Source])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSourcesProtocol {
    
    var view: PresenterToViewSourcesProtocol? { get set }
    var interactor: PresenterToInteractorSourcesProtocol? { get set }
    var router: PresenterToRouterSourcesProtocol? { get set }
    var source: [Source] { get set}
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSourcesProtocol {
    
    var presenter: InteractorToPresenterSourcesProtocol? { get set }
    var category: String? {get set}
    var network: NetworkManager { get set }
    
    func loadSource()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSourcesProtocol {
    func fetchSourceSuccess(source: [Source])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSourcesProtocol {
    
}
