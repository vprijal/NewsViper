//
//  SourcesRouter.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation
import UIKit

class SourcesRouter: PresenterToRouterSourcesProtocol {
    
    // MARK: Static methods
    static func createModule(category: String) -> UIViewController {
        
        let viewController = SourcesViewController()
        
        let presenter: ViewToPresenterSourcesProtocol & InteractorToPresenterSourcesProtocol = SourcesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SourcesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SourcesInteractor()
        viewController.presenter?.interactor?.category = category
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }

    func navigateToArticle(on view: PresenterToViewSourcesProtocol, with sourceId: String) {
        let sourceVC = ArticlesRouter.createModule(sourceId: sourceId)
        let viewController = view as! SourcesViewController
        viewController.navigationController?
            .pushViewController(sourceVC, animated: true)
    }
    
}
