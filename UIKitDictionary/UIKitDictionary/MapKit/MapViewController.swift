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
    
    let moveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Move To next Page", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
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
    
    let map: MKMapView = {
        let map = MKMapView()
        return map
    }()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        configureButton()
    }
    
    // MARK: - Actions
    
    @objc func moveRegion() {
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10, longitude: 10), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)), animated: true)
    }
    
    // MARK: - Helpers
    
    func configureMap() {
        map.register(MKAnnotationViewPractice.self, forAnnotationViewWithReuseIdentifier: "cell")
        map.addAnnotations([anno1, anno2])
        
        map.delegate = self
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        map.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        map.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func configureButton() {
        view.addSubview(moveButton)
        moveButton.addTarget(self, action: #selector(moveRegion), for: .touchUpInside)
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        moveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        moveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        moveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        moveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        cell.titleTemp = annotation.title ?? ""
        return cell
    }
    
}
