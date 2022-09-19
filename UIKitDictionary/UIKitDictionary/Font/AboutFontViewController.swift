//
//  AboutFont.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/09/19.
//

import UIKit

class AboutFontViewController: UIViewController {
    
    // MARK: - Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "My name is Park"
        label.textColor = .systemBlue
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My title is This"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemBlue
        return label
    }()
    
    private let chapterLabel: UILabel = {
        let label = UILabel()
        label.text = "My Chapter is 4 now"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.font = UIFont.boldSystemFont(ofSize: 16) // largeTitle을 무시하고, bold로 대입시킴
        label.textColor = .systemBlue
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, titleLabel, chapterLabel])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

}
