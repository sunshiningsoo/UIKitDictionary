//
//  AnnotationDetailViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/14.
//

import UIKit
import MapKit

protocol DeselectAnnotation {
    func annotationDeselect(annotation: MKAnnotation)
}

class AnnotationDetailViewController: UIViewController {

    // MARK: - Properties
    
    var selectedAnnotation: MKAnnotation? {
        didSet {
            print(selectedAnnotation?.coordinate.latitude)
        }
    }
    var delegate: DeselectAnnotation?
    
    let titleHeaderElementKind: String = "titleKind"
    let moreInfoHeaderElementKind: String = "moreInfo"
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: throwCollectionViewLayout())
        return cv
    }()
    
    func throwCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection in
            if sectionIndex == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.bottom = 1
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets.leading = 17
                section.contentInsets.trailing = 17
                
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), elementKind: self.titleHeaderElementKind, alignment: .topLeading)]
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.bottom = 1
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets.leading = 17
                section.contentInsets.trailing = 17
                
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: self.moreInfoHeaderElementKind, alignment: .topLeading)]
                return section
                
            }
        }
        return layout
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let annotation = selectedAnnotation else { return print("GUARD") }
        delegate?.annotationDeselect(annotation: annotation)
    }
    
    // MARK: - Actions

    
    // MARK: - Helpers
    
    func configureCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(DefaultCollectionViewCell.self, forCellWithReuseIdentifier: DefaultCollectionViewCell.identifier)
        collectionView.register(TitleCollectionReusableView.self, forSupplementaryViewOfKind: titleHeaderElementKind, withReuseIdentifier: TitleCollectionReusableView.identifier)
        
        collectionView.register(MoreInformationReusableView.self, forSupplementaryViewOfKind: moreInfoHeaderElementKind, withReuseIdentifier: MoreInformationReusableView.identifier)
        collectionView.register(MoreInformationCollectionViewCell.self, forCellWithReuseIdentifier: MoreInformationCollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

// MARK: - UICollectionViewDelegate

extension AnnotationDetailViewController: UICollectionViewDelegate {
    // Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell?
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.identifier, for: indexPath) as! DefaultCollectionViewCell
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreInformationCollectionViewCell.identifier, for: indexPath) as! MoreInformationCollectionViewCell
        default:
            print("1")
        }
        guard let cell = cell else { return UICollectionViewCell() }
        if let cell = cell as? DefaultCollectionViewCell {
            cell.delegate = self
        }
        return cell
    }
    
    // Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header = UICollectionReusableView()
        switch indexPath.section {
        case 0:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: titleHeaderElementKind, withReuseIdentifier: TitleCollectionReusableView.identifier, for: indexPath) as! TitleCollectionReusableView
        case 1:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: moreInfoHeaderElementKind, withReuseIdentifier: MoreInformationReusableView.identifier, for: indexPath) as! MoreInformationReusableView
        default:
            print("ERR")
        }
        
        return header
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIViewController()
        controller.view.backgroundColor = .systemBackground
        present(controller, animated: true)
        print(indexPath.section)
    }
    
}

// MARK: - UICollectionViewDataSource

extension AnnotationDetailViewController: UICollectionViewDataSource {
    // Items in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // Number of Section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

extension AnnotationDetailViewController: CheckIn {
    func checkIn() {
        print("checkin")
    }
}
