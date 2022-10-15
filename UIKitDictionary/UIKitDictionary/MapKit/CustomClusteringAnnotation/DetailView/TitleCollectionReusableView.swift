//
//  TitleCollectionReusableView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/14.
//

import UIKit

class TitleCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier: String = String(describing: TitleCollectionReusableView.self)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "오피스 제주"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    let distance: UILabel = {
        let label = UILabel()
        label.text = "1.5km"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let userState: UILabel = {
        let label = UILabel()
        label.text = "💻 업무중"
        label.textColor = UIColor(named: "tempblue")
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
        self.addSubview(distance)
        distance.translatesAutoresizingMaskIntoConstraints = false
        distance.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 20).isActive = true
        distance.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
        self.addSubview(userState)
        userState.translatesAutoresizingMaskIntoConstraints = false
        userState.leftAnchor.constraint(equalTo: distance.rightAnchor, constant: 64).isActive = true
        userState.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
