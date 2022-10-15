//
//  MoreInformationReusableView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/15.
//

import UIKit

class MoreInformationReusableView: UICollectionReusableView {
        
    static let identifier: String = String(describing: MoreInformationReusableView.self)
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "세부 사항"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        backgroundColor = .systemCyan
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
