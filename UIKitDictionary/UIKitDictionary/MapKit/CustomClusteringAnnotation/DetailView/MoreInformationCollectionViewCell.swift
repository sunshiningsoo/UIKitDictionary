//
//  MoreInformationCollectionViewCell.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/15.
//

import UIKit

class MoreInformationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = String(describing: MoreInformationCollectionViewCell.self)
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        return label
    }()
    
    let phoneNumber: UILabel = {
        let label = UILabel()
        label.text = "02-456-5745"
        return label
    }()
    
    lazy var phoneNumberStack: UIStackView = {
        var stack = UIStackView()
        stack.addArrangedSubview(phoneNumberLabel)
        stack.addArrangedSubview(phoneNumber)
        stack.axis = .horizontal
        stack.spacing = 30
        stack.distribution = .fill
        return stack
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
//        divider.frame = CGRect(origin: .zero, size: CGSize(width: , height: 1))
        return view
    }()
    
    lazy var detailStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [phoneNumberStack, divider, UILabel()])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.backgroundColor = .brown
        return stack
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        self.addSubview(detailStack)
        detailStack.translatesAutoresizingMaskIntoConstraints = false
        detailStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        detailStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        detailStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        detailStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    
    
}
