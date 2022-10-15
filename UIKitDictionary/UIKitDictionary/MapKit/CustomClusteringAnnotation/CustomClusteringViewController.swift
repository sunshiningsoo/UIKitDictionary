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
    let data = testData.datas
    
    let map1: MKMapView = {
        let map = MKMapView()
        
        return map
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
    }
    
    // MARK: - Actions

    
    // MARK: - Helpers
    
    func configureMap() {
        view.addSubview(map1)
        
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
        map1.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: view.coordinate.latitude - 0.25, longitude: view.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)), animated: true)
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
