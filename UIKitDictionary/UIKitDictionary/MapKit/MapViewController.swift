//
//  MapViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/01.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    let anno1: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 33.533215170493584, longitude: 126.63091291334615)
        annotation.title = "오피스 제주"
        annotation.subtitle = "조천점"
        return annotation
    }()
    
    let anno2: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 33.4, longitude: 126.7)
        annotation.title = "오피스"
        annotation.subtitle = "사계점"
        return annotation
    }()
    
    lazy var map: MKMapView = {
        let map = MKMapView()
        map.addAnnotations([anno1, anno2])
        return map
    }()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.register(MKAnnotationViewPractice.self, forAnnotationViewWithReuseIdentifier: "cell")
        
        map.delegate = self
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        map.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        map.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    

}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("view Tapped: \(view.annotation?.title)")

    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("view deinitTapped: \(view.annotation?.title)")
    }
    
    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
        let cluster = MKClusterAnnotation(memberAnnotations: [anno1, anno2])
        return cluster
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let cell = mapView.dequeueReusableAnnotationView(withIdentifier: "cell") as? MKAnnotationViewPractice else { return MKAnnotationView() }
        cell.titleTemp = anno1.title
        return cell
    }
    
}
