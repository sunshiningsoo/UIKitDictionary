//
//  SubscriptViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2023/01/18.
//

import UIKit

// String Extension REF: https://babbab2.tistory.com/123
extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        // startIndex에서 idx만큼 떨어진 놈의 index를 리턴하는 것임
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}

class Stack {
    var stack: [Int] = [2, 3, 4]
    
    // python에서 문자열을 처리하듯이 index를 활용해서 접근할 수 있게 만들어 준다.
    // String의 extension으로 빼서 만들어주는 경우가 많은 것 같음
    
    subscript(index: Int) -> Int {
        get {
            if let element = stack.randomElement() {
                return element
            }
            return 0
        }
        // stack
        set {
            stack.append(newValue)
        }
    }
    
}

class SubscriptViewController: UIViewController {
    
    var stack = Stack()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("popStack", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.addTarget(self, action: #selector(popStack), for: .touchUpInside)
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
    
    @objc func popStack() {
        print(stack[0]) // Stack의 subscript에서 get 프로퍼티를 부름
        print(stack.stack)
        print(stack[0] = 3) // Stack의 sunbscript에서 get 프로퍼티를 부르게 됨
        print(stack.stack)
        
    }
    

}
