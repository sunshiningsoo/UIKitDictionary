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
