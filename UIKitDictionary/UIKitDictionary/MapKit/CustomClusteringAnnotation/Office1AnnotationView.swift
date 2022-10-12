//
//  OfficeAnnotationView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/11.
//

import UIKit
import MapKit

class Office1AnnotationView: MKAnnotationView {
    
    static let identifier: String = "office"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "officeonly"
        
        frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
    }

}
