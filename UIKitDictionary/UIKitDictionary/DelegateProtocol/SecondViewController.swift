//
//  SecondViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/08/09.
//

import UIKit

protocol ChangeLabel {
    func changeLabel()
}

class SecondViewController: UIViewController {
    
    var delegate: ChangeLabel?

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Fisrt page", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(goToFirstView), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func goToFirstView() {
        delegate?.changeLabel()
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configureUI()
        
    }
    
    private func render() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
    }
}
