//
//  ClusterAnnotationView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/11.
//

import UIKit
import MapKit

class ClusterAnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        print("Clustering init")
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        
        super.prepareForDisplay()
                
        if let cluster = annotation as? MKClusterAnnotation {
            if cluster.memberAnnotations.count > 0 {
                if count(rideType: .bicycle) > 0 {
                    image = UIImage(systemName: "pencil")
                    frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
                    print(count(rideType: .bicycle))
                } else {
                    image = UIImage(systemName: "bicycle")
                    frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
                }
            }
        }
    }
    
    func count(rideType: Cycle.CycleType) -> Int {
        guard let cluster = annotation as? MKClusterAnnotation else {
            return 0
        }
        
        return cluster.memberAnnotations.filter { member -> Bool in
            guard let bike = member as? Cycle else {
                fatalError("asdf")
            }
            return bike.type == rideType
        }.count
        
    }
    
}
