//
//  CompositionalDetailCollectionViewCell.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/12.
//

import UIKit

class CompositionalDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "detailidentifier"
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemCyan
        self.layer.cornerRadius = 10
        addSubview(label)
        label.frame = bounds
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
