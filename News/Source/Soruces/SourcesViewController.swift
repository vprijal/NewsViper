//
//  SourcesViewController.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import UIKit

class SourcesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterSourcesProtocol?
    
}

extension SourcesViewController: PresenterToViewSourcesProtocol{
    // TODO: Implement View Output Methods
}
