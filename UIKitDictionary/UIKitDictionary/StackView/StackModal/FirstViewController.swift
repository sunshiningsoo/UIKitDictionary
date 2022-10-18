//
//  FirstViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/18.
//

import UIKit

class FirstViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("modal", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.addTarget(self, action: #selector(modalUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func modalUp() {
        let controller = ModalViewController()
        controller.sheetPresentationController?.detents = [.medium(), .large()]
        present(controller, animated: true)
    }
    


}
