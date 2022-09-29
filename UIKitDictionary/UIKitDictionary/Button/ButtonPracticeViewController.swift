//
//  ButtonPracticeViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/09/29.
//

import UIKit

class ButtonPracticeViewController: UIViewController {

    // MARK: - Properties
    
    private let justButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let justButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let justButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(justButton)
        justButton.translatesAutoresizingMaskIntoConstraints = false
        justButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        justButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(justButton2)
        justButton2.translatesAutoresizingMaskIntoConstraints = false
        justButton2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        justButton2.topAnchor.constraint(equalTo: justButton.bottomAnchor, constant: 100).isActive = true
        
        view.addSubview(justButton3)
        justButton3.translatesAutoresizingMaskIntoConstraints = false
        justButton3.leftAnchor.constraint(equalTo: justButton2.rightAnchor, constant: 100).isActive = true
        justButton3.topAnchor.constraint(equalTo: justButton.bottomAnchor, constant: 100).isActive = true
    }
    
    

}
