//
//  UIKitController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/12/16.
//

import SwiftUI

class UIKitController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("화면 넘어가기", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(navigation), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func navigation() {
        // SwiftUIView로 넘겨줄때, UIKitController에서 사용하고 있는 navigationController를 같이 넘겨준다.
        navigationController?.pushViewController(UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController)), animated: true)
    }
    
}
