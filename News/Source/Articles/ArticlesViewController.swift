//
//  ArticlesViewController.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import UIKit

class ArticlesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterArticlesProtocol?
    
}

extension ArticlesViewController: PresenterToViewArticlesProtocol{
    // TODO: Implement View Output Methods
}

extension ArticlesViewController {
    func setupUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "Article"
    }
}
