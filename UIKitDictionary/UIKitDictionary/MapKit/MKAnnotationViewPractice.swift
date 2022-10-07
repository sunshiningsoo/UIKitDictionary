//
//  MKAnnotationViewPractice.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/05.
//

import UIKit
import MapKit

class MKAnnotationViewPractice: MKAnnotationView {
    
    // MARK: - Properties
    
    var titleTemp: String? {
        didSet {
            titleLabel.text = titleTemp
        }
    }
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        return titleLabel
    }()
    
    var customBackgroundColor: UIColor {
        switch titleTemp {
        case "오피스 제주":
            return .systemBlue
        case "오피스":
            return .red
        default:
            return .white
        }
    }

    // MARK: - LifeCycle
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.layer.cornerRadius = 40 / 2
        centerOffset = CGPoint(x: 0, y: -frame.size.height / 2)
        
        canShowCallout = true // 클릭시, 위에 bubble처럼 뜨게 되는 것
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        DispatchQueue.main.async {
            self.backgroundColor = self.customBackgroundColor
        }
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    

}
