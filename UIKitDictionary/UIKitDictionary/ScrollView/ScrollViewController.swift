//
//  ScrollViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/07/25.
//

import UIKit

class ScrollViewController: UIViewController {

    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let pracLabel : UILabel = {
        let pracLabel = UILabel()
        pracLabel.text = "this is label"
        return pracLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    private func render() {
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(pracLabel)
        pracLabel.translatesAutoresizingMaskIntoConstraints = false
        pracLabel.topAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 0).isActive = true
        pracLabel.leftAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
    }

}
