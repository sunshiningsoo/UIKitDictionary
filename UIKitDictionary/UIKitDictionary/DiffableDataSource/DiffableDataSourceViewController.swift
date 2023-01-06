//
//  DiffableDataSourceViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2023/01/05.
//

import UIKit

struct Fruit: Hashable {
    let title: String
    
}

class DiffableDataSourceViewController: UIViewController, UITableViewDelegate {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    // enum은 hashable이 디폴트다
    enum Section {
        case first, second
    }
    
    // diffable data source는 값이 유일해야함
    // Generic 하게 들어가야 하는 부분은 Hashable해야한다., 모든 모델은 uniq 해야 한다. same hash를 추가하면 앱 crash임
    var dataSource: UITableViewDiffableDataSource<Section, Fruit>!
    
    var fruits = [Fruit]()
    var secondFruits = [Fruit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, model in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model.title
            return cell
        })
        
        title = "MyFruits"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapAdd))
        
    }
    
    @objc func didTapAdd() {
        let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)
        
        for x in 0...100 {
            actionSheet.addAction(UIAlertAction(title: "Fruits\(x+1)", style: .default, handler: { [weak self] _ in
                let fruit = Fruit(title: "\(x+1)")
                if x > 5 {
                    self?.secondFruits.append(fruit)
                } else {
                    self?.fruits.append(fruit)
                }
                self?.updateDatasource(num: x)
                
            }))
        }
        
        
        present(actionSheet, animated: true)
    }
    
    func updateDatasource(num: Int) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        if num > 5 {
            snapshot.appendSections([.second])
            snapshot.appendItems(secondFruits, toSection: .second)
        } else {
            snapshot.appendSections([.first])
            snapshot.appendItems(fruits, toSection: .first)
        }
        
        
        // 이거 덕에 reloadData해줄 필요가 없음
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let fruit = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        print(fruit.title)
    }
    

}
