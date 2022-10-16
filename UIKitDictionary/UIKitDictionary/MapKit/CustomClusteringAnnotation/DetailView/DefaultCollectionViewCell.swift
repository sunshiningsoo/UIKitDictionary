//
//  DefaultCollectionViewCell.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/14.
//

import UIKit

protocol CheckIn {
    func checkIn()
}

class DefaultCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var delegate: CheckIn?
    
    static let identifier: String = String(describing: DefaultCollectionViewCell.self)
    
    static let cellType: DetailCellType = .checkInPeopleCell
    
    let date: UILabel = {
        let label = UILabel()
        label.text = "2022년 10월 23일"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let profileImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = .red
        image.frame = CGRect(origin: .zero, size: CGSize(width: 42, height: 42))
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    let profileImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = .red
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    let profileImage3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = .red
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    lazy var checkInButton: UIButton = {
        let button = UIButton()
        button.setTitle("체크인하기", for: .normal)
        button.addTarget(self, action: #selector(checkIn), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        backgroundColor = .lightGray
        
        configureDate()
        configureImage()
        configureCheckInButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func checkIn() {
        delegate?.checkIn()
    }
    
    
    // MARK: - Helpers
    
    func configureImage() {
        
        self.addSubview(profileImage1)
        profileImage1.translatesAutoresizingMaskIntoConstraints = false
        profileImage1.widthAnchor.constraint(equalToConstant: 42).isActive = true
        profileImage1.heightAnchor.constraint(equalToConstant: 42).isActive = true
        profileImage1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        profileImage1.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 10).isActive = true
        
        self.addSubview(profileImage2)
        profileImage2.translatesAutoresizingMaskIntoConstraints = false
        profileImage2.widthAnchor.constraint(equalToConstant: 42).isActive = true
        profileImage2.heightAnchor.constraint(equalToConstant: 42).isActive = true
        profileImage2.leftAnchor.constraint(equalTo: profileImage1.leftAnchor, constant: 18).isActive = true
        profileImage2.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 10).isActive = true
        
        self.addSubview(profileImage3)
        profileImage3.translatesAutoresizingMaskIntoConstraints = false
        profileImage3.widthAnchor.constraint(equalToConstant: 42).isActive = true
        profileImage3.heightAnchor.constraint(equalToConstant: 42).isActive = true
        profileImage3.leftAnchor.constraint(equalTo: profileImage2.leftAnchor, constant: 18).isActive = true
        profileImage3.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 10).isActive = true
        
    }
    
    func configureDate() {
        
        self.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        date.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
    }
    
    func configureCheckInButton() {
        
        self.addSubview(checkInButton)
        checkInButton.translatesAutoresizingMaskIntoConstraints = false
        checkInButton.leftAnchor.constraint(equalTo: profileImage3.rightAnchor, constant: 20).isActive = true
        checkInButton.topAnchor.constraint(equalTo: profileImage3.topAnchor).isActive = true
    }
    
}
