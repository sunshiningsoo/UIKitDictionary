//
//  CustomClusteringViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/11.
//

import UIKit
import MapKit

class CustomClusteringViewController: UIViewController {

    // MARK: - Properties
    
    var manager: CLLocationManager?
    
    let data = testData.datas
    
    let map1: MKMapView = {
        let map = MKMapView()
        
        return map
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        
        manager = CLLocationManager()
        guard let manager = manager else {
            return
        }
        manager.delegate = self
        
        let circle = MKCircle(center: map1.userLocation.coordinate, radius: 100)
        map1.addOverlay(circle)
    }
    
    // MARK: - Actions

    
    // MARK: - Helpers
    
    func configureMap() {
        view.addSubview(map1)
//        map1.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)), animated: true)
        map1.register(Office1AnnotationView.self, forAnnotationViewWithReuseIdentifier: Office1AnnotationView.identifier)
        map1.register(ActivityAnnotationView.self, forAnnotationViewWithReuseIdentifier: ActivityAnnotationView.identifier)
        map1.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        map1.delegate = self
        map1.addAnnotations(data)
        
        map1.translatesAutoresizingMaskIntoConstraints = false
        map1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        map1.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        map1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        map1.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
    

}

extension CustomClusteringViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Cycle else { return nil }
        
        switch annotation.type {
        case .unicycle:
            return Office1AnnotationView(annotation: annotation, reuseIdentifier: Office1AnnotationView.identifier)
        case .bicycle:
            return ActivityAnnotationView(annotation: annotation, reuseIdentifier: ActivityAnnotationView.identifier)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let tempView = view as? ClusterAnnotationView {
            return print("THIS IS NOT A ANNOTATIONVIEW")
        }
        guard let view = view.annotation else { return }
        map1.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: view.coordinate.latitude - 0.25, longitude: view.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
        let controller = AnnotationDetailViewController()
        controller.delegate = self
        controller.selectedAnnotation = view
        
        controller.sheetPresentationController?.detents = [.medium(), .large()]
        present(controller, animated: true)
        
        
    }
    
}

// MARK: - DeselectAnnotation
extension CustomClusteringViewController: DeselectAnnotation {
    func annotationDeselect(annotation: MKAnnotation) {
        // TODO: - annotation을 지금은 안쓰고 있지만, Detail뷰로 넘겨줄때에는 꼭 필요한 정보라고 생각함
        map1.selectedAnnotations = []
    }
}

extension CustomClusteringViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(manager.location?.coordinate)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("CHANGED AUTH")
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        guard let location = manager.location else { return print("RETURN !")}
        let circle = MKCircle(center: location.coordinate, radius: 100)
        map1.showsUserLocation = true
        
//        map1.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)), animated: true)
        print(location.coordinate.longitude)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        print("RENDERED")
        let circles = MKCircleRenderer(overlay: overlay)
        circles.fillColor = .brown
        circles.lineWidth = 1.0
        circles.alpha = 0.25
        
        return circles
        
    }
}

extension CustomClusteringViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
//        sheetPresentationController.detents.
    }
}
