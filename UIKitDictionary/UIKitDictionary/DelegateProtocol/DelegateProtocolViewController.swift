//
//  DelegateProtocolViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/08/09.
//

import UIKit

class DelegateProtocolViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to next page", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(goToSecondView), for: .touchUpInside)
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "This is First Page!!"
        return label
    }()
    
    @objc
    private func goToSecondView() {
        let vc = SecondViewController()
        vc.delegate = self
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
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
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50).isActive = true
        
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
    }
    

}


extension DelegateProtocolViewController: ChangeLabel {
    func changeLabel() {
        label.text = label.text == "This is First Page!!" ? "Label text changed!" : "This is First Page!!"
    }
}
