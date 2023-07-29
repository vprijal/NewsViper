//
//  CategoriesCell.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//

import Foundation
import UIKit
import SnapKit

class CategoriesCell: UICollectionViewCell {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.text = "Month"
        label.textColor = UIColor(named: "#002E4E")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupView() {
       setupConstraint()
    }
    
    func setupConstraint() {
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
        }
    
    }
}
