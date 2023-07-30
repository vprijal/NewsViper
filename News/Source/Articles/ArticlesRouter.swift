//
//  ArticlesRouter.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation
import UIKit

class ArticlesRouter: PresenterToRouterArticlesProtocol {
    
    // MARK: Static methods
    static func createModule(sourceId: String) -> UIViewController {
        
        let viewController = ArticlesViewController()
        
        let presenter: ViewToPresenterArticlesProtocol & InteractorToPresenterArticlesProtocol = ArticlesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ArticlesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ArticlesInteractor()
        viewController.presenter?.interactor?.sourceID = sourceId
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
