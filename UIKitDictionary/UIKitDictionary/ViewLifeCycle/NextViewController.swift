//
//  NextViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/08/10.
//

import UIKit

class NextViewController: UIViewController {
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    
    @objc
    func back() {
        self.dismiss(animated: true)
    }
    
    override func loadView() {
        super.loadView()
        print("loadView2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad2")
        render()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear2")
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear2")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear2")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear2")
    }
    
    
    private func render() {
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
    }
    
}
