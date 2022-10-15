//
//  CompositionalCollectionViewCell.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/12.
//

import UIKit

class CompositionalHeaderCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CompositionalHeaderCell"
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "label!!!!!!!"
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("button!!", for: .normal)
        button.addTarget(self, action: #selector(tappp), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 60).isActive = true
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
    }
    
    @objc func tappp() {
        print("tap!!!!!!!!!!!!!!")
        self.backgroundColor = self.backgroundColor == .systemBlue ? .red : .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
