//
//  ModalViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/18.
//

import UIKit

class ModalViewController: UIViewController {
    
    // MARK: - Properties
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .systemBackground
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let stack1: CustomStackView = {
        let stack = CustomStackView()
        stack.stackType = .second
        stack.heightAnchor.constraint(equalToConstant: 500).isActive = true
        // stack의 height를 지정해주어야 만들어
        return stack
    }()
    
    let stack2: CustomStackView = {
        let stack = CustomStackView()
        stack.stackType = .first
        stack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return stack
    }()
    
    let stack3: CustomStackView = {
        let stack = CustomStackView()
        stack.stackType = .second
        stack.heightAnchor.constraint(equalToConstant: 700).isActive = true
        return stack
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("BUTTON", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = . systemBackground
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func floatingButtonTapped() {
        print("FLOATING BUTTON TAPPED")
        self.dismiss(animated: true)
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [stack1, stack2, stack3])
        let sub: [CustomStackView] = stack.arrangedSubviews.map { $0 as! CustomStackView }
        for temp in sub {
            switch temp.stackType {
            case .first:
                temp.backgroundColor = .red
            case .second:
                temp.backgroundColor = .blue
            default:
                print("DEFAULT CASE CAME OUT")
            }
        }
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.spacing = 10
        
        scrollView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        stack.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        stack.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        stack.rightAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 40).isActive = true
        
    }


}
