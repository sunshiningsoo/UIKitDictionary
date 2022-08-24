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
        vc.delegate = self // 바뀌는 객체 혹은 액션이 일어나는 객체에 대한 delegate로 protocol의 function이 작동하게 만들어 주어야 한다.
        // vc.delegate = self 의 의미는 SecondViewcontroller의 delegate 함수를 DelegateProtocolViewContoller가 다뤄줄꺼야 라는 뜻
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


// DelegateProtocolViewController가 ChangeLabel 프로토콜을 따르기 때문에, 내부함수 changeLabel()을 구현해주어여 한다.
extension DelegateProtocolViewController: ChangeLabel {
    func changeLabel() {
        label.text = label.text == "This is First Page!!" ? "Label text changed!" : "This is First Page!!"
    }
}
