//
//  TestData.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/11.
//

import Foundation
import MapKit

struct testData {
    static let datas: [Cycle] = [Cycle(latitude: 33, longitude: 126, type: .bicycle), Cycle(latitude: 33, longitude: 126.3, type: .bicycle), Cycle(latitude: 33.1, longitude: 126.1, type: .unicycle), Cycle(latitude: 33.2, longitude: 126.1, type: .unicycle), Cycle(latitude: 34.1, longitude: 126.1, type: .unicycle), Cycle(latitude: 33.1, longitude: 126.5, type: .unicycle)]
}

class Cycle: NSObject, Decodable, MKAnnotation {
    
    enum CycleType: Int, Decodable {
        case unicycle
        case bicycle
    }
    
    var type: CycleType = .unicycle
    
    private var latitude: CLLocationDegrees = 0
    private var longitude: CLLocationDegrees = 0
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, type: CycleType) {
        self.latitude = latitude
        self.longitude = longitude
        self.type = type
    }
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        set {
            // For most uses, `coordinate` can be a standard property declaration without the customized getter and setter shown here.
            // The custom getter and setter are needed in this case because of how it loads data from the `Decodable` protocol.
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
}
