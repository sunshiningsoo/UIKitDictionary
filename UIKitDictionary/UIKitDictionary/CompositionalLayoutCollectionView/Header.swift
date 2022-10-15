//
//  HeaderCollectionReusableView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/14.
//

import UIKit

protocol headerMove {
    func move()
}

class Header: UICollectionReusableView {
    var delegate: headerMove?
    let name = UILabel()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.addTarget(self, action: #selector(newPage), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(name)
        name.text = "Categories"
        
        addSubview(button)
    }
    
    @objc func newPage() {
        print("newPage")
        delegate?.move()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        name.frame = bounds
        button.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
