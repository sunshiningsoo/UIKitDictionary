//
//  StackViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/09/14.
//

import UIKit

class StackViewController: UIViewController {
    
    // MARK: - Properties
    
    private let nameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("HEY", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let firstNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FIRST", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let secondNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SECOND", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        // stack의 경우 간단하게 ui를 그려주는 뷰에서 넣어서 만들어주는 것이 편하게 사용하는 방법임
        let stack = UIStackView(arrangedSubviews: [nameButton, firstNameButton, secondNameButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
}
