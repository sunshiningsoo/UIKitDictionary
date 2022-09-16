//
//  ImagePickerViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/08/28.
//
// REF: https://zeddios.tistory.com/949
// REF: https://zeddios.tistory.com/125
// REF: https://hryang.tistory.com/32

import UIKit

class ImagePickerViewController: UIViewController {
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.setTitle("OPEN", for: .normal)
        button.addTarget(self, action: #selector(library), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        return button
    }()
    
    private var imageView : UIImageView = {
        let image = UIImageView()
        // #imageLiteral() -> 이미지 선택 가능하게 바뀜
        image.image = UIImage()
        image.backgroundColor = .red
        return image
    }()
    
    @objc
    func library() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(openButton)
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: openButton.bottomAnchor, constant: 40).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
    }

}

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print(info)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true)
    }
}
