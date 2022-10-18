//
//  CustomStackView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/18.
//

import UIKit

enum stackType: CaseIterable {
    case first
    case second
}

class CustomStackView: UIStackView {
    
    // MARK: - Properties
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.font = UIFont.systemFont(ofSize: 100)
        label.layer.backgroundColor = CGColor(gray: 1, alpha: 1)
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("BUTTON", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        return button
    }()
    
    var stackType: stackType?
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let temp = UIView()
        temp.backgroundColor = .brown
        let stack = UIStackView(arrangedSubviews: [label, button, temp])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        
        self.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
