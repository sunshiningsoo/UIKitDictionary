//
//  ButtonViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/08/05.
//

import UIKit

class ButtonViewController: UIViewController {
    
    private lazy var buttonNormal: UIButton = {
        let button = UIButton()
        button.isPointerInteractionEnabled = true
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tap), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc func tap() {
        print("tap!")
    }
    
    private let buttonDisabled: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .highlighted)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        buttonAction()
        configUI()
    }
    
    private func render() {
        view.addSubview(buttonNormal)
        buttonNormal.translatesAutoresizingMaskIntoConstraints = false
        buttonNormal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        buttonNormal.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(buttonDisabled)
        buttonDisabled.translatesAutoresizingMaskIntoConstraints = false
        buttonDisabled.leftAnchor.constraint(equalTo: buttonNormal.rightAnchor, constant: 50).isActive = true
        buttonDisabled.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func buttonAction() {
        
        if buttonNormal.isHovered {
            print("this is hovered")
        }
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
    }
    

}
