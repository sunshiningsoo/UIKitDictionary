//
//  OfficeAnnotationView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/10.
//

import UIKit
import MapKit

class OfficeAnnotationView: MKAnnotationView {

    // MARK: - Properties
    
    static let cellIdentifier: String = "OfficeAnnotationViewCellIdentifier"
    
    // MARK: - LifeCycle
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        if let cluster = annotation as? MKAnnotationView {
            image = UIImage()
        }
    }
    
    private func configureUI() {
        frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        backgroundColor = .brown
    }
}
