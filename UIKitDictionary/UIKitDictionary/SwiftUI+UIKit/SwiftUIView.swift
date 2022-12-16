//
//  SwiftUIView.swift
//  UIKitDictionary
//
//  Created by 박성수 on 2022/12/16.
//

import SwiftUI

struct SwiftUIView: View {
    
    // UIKitController의 UINavigationController를 받아와서 Action 할 수 있게 만들어줌
    weak var navigationController: UINavigationController?
    var body: some View {
        VStack (spacing: 50) {
            Button {
                navigationController?.popToRootViewController(animated: true)
            } label: {
                Text("GO ROOT CONTROLLER")
            }
            
            Button {
                navigationController?.pushViewController(UIKitController(), animated: true)
            } label: {
                Text("GO TO NEXT NEW PAGE")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
