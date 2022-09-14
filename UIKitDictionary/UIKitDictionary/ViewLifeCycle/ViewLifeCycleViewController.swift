//
//  ViewLifeCycleViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/08/10.
//

import UIKit

class ViewLifeCycleViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to next page", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    
    @objc
    func nextPage() {
        let vc = NextViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    override func loadView() {
        // 뷰를 만들어주는 역할, 만들어 메모리에 올라가면 viewDidLoad가 호출됨
        super.loadView() // super.loadView()가 없다면 무한루프에 갖힘 앱이 켜지지 않음
        print("loadView1")
    }
    
    override func viewDidLoad() {
        // 처음 1번만 실행 되어야 하는 코드들 -> 메모리에 올라가게 될때, 한번만 불리는 초기화 함수
        // 리소스 초기화, 초기 화면을 구성하는 용도
        // 다른 뷰로 갔다가 돌아오는 상황에서는 로드되지 않음 navigation의 rootView 라면 재호출 되지 않는다는 말
        super.viewDidLoad()
        print("ViewDidLoad1")
        
        render()
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        // 다른 뷰로 이동후 돌아와 설정해주어야 하는 값들을 설정해주어야 한다. viewDidLoad가 재호출 되지 않음
        super.viewWillAppear(animated)
        print("viewWillAppear1")
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 화면에 그려줄 애니메이션을 처리해주기도 함
        super.viewDidAppear(animated)
        print("viewDidAppear1")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear1")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear1")
    }
    
    private func render() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func configureUI() {
        
    }
    

}
