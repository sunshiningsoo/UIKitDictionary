//
//  CompositionalCollectionViewLayoutViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/10/12.
//

import UIKit
import SwiftUI

class CompositionalCollectionViewLayoutViewController: UIViewController {
    
    // MARK: - Properties
        
    static let categoryheaderid = "headeride"
    let headerid = "asdf"
    let data = Dummy.dummy
    
    var count: Int = 0
    
    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout() // collecytionView의 init에서는 layout에 대한 초기화를 함께 진행해 주어야 한다.
        
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 16
                // 아래 section에서 header를 추가해주었기 때문에, bottom 패딩값을 주지 않아도 된다.
                // 그냥 딱 달라붙게 만들어줌
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
                return section
            } else if sectionNumber == 1 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                // section에 header 추가해주는 코드
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryheaderid, alignment: .topLeading)]
                
                return section
                
            } else if sectionNumber == 2 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(120)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                return section
                
                
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.5)))
                item.contentInsets.top = 1
                item.contentInsets.trailing = 1

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryheaderid, alignment: .topLeading)]
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            }
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
    }
    
    // MARK: - Helpers
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CompositionalHeaderCollectionViewCell.self, forCellWithReuseIdentifier: CompositionalHeaderCollectionViewCell.identifier)
        collectionView.register(CompositionalDetailCollectionViewCell.self, forCellWithReuseIdentifier: CompositionalDetailCollectionViewCell.identifier)
        collectionView.register(Header.self, forSupplementaryViewOfKind: CompositionalCollectionViewLayoutViewController.categoryheaderid, withReuseIdentifier: headerid)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

}

// MARK: - UICollectionViewDelegate

extension CompositionalCollectionViewLayoutViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
    
}

// MARK: - UICollectionViewDataSource

extension CompositionalCollectionViewLayoutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section != 0 {
            return data.count
//        }
//        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalHeaderCollectionViewCell.identifier, for: indexPath) as? CompositionalHeaderCollectionViewCell else { return UICollectionViewCell() }
//            cell.label.text = "\(count)"
//            count += 1
            cell.label.text = data[indexPath.item]
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalDetailCollectionViewCell.identifier, for: indexPath) as? CompositionalDetailCollectionViewCell else { return UICollectionViewCell() }
            cell.label.text = data[indexPath.item]
            
            return cell
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerid, for: indexPath) as? Header else { return UICollectionReusableView() }
        header.backgroundColor = .systemBlue
        header.delegate = self
        return header
    }
    
}

extension CompositionalCollectionViewLayoutViewController: headerMove {
    func move() {
        let temp = UIViewController()
        temp.view.backgroundColor = .systemBackground
        present(temp, animated: true)
    }
}


