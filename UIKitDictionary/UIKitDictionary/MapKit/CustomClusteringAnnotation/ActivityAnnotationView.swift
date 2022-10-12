//
//  ActivityAnnotationView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/11.
//

import UIKit
import MapKit

class ActivityAnnotationView: MKAnnotationView {

    static let identifier: String = "activity"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "activityonly"
        
        frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultHigh
    }


}
