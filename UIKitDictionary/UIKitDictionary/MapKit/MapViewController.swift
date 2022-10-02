//
//  MapViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/01.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let map: MKMapView = {
        let map = MKMapView()
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 33.533215170493584, longitude: 126.63091291334615)
        annotation.title = "오피스 제주"
        annotation.subtitle = "조천점"
        map.addAnnotations([annotation])
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        map.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        map.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    

}
