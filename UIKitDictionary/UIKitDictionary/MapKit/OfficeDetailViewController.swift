//
//  OfficeDetailViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/11.
//

import UIKit

class OfficeDetailViewController: UIViewController {

    // MARK: - Properties
    
    var viewTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configure()
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    
    func configure() {
        view.addSubview(viewTitle)
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        viewTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        
    }
}
