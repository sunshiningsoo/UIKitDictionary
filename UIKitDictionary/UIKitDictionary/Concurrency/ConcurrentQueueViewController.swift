//
//  ConcurrentQueueViewController.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2023/01/10.
//

import UIKit

class ConcurrentQueueViewController: UIViewController {

    // concurrent라는 queue에 serialize하게 들어가 실행되도록 만들어준다.
    let queue = DispatchQueue(label: "concurrent")
    var num1: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .default).async {
            self.num2Func()
        }
        num1Func()
        
    }
    
    func num1Func() {
        while true {
            queue.async {
                print("num1Func: \(self.num1)")
                self.num1 += 1
            }
        }
    }
    
    func num2Func() {
        while true {
            queue.async {
                print("num2Func: \(self.num1)")
                self.num1 += 1
            }
        }
    }
    
}
