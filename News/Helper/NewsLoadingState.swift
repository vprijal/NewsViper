//
//  NewsLoadingState.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//

import Foundation
import UIKit
import SnapKit

class NewsLoadingState: UIView {

    lazy var indicator = UIActivityIndicatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false

        indicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        indicator.style = .medium
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
    }
}
