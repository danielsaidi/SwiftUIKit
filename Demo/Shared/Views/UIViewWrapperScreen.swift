//
//  UIViewWrapperScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI
import SwiftUIKit

struct UIViewWrapperScreen: View {
 
    var body: some View {
        List {
            Section {
                ListTextItem("This view can be used to wrap any UIKit view.")
            }
            Section(header: Text("Examples")) {
                UIViewWrapper(view: {
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
                    view.backgroundColor = .red
                    view.layer.cornerRadius = 10
                    return view
                }())
                UIViewWrapper(view: UISwitch())
                UIViewWrapper(view: UIImageView(image: UIImage(named: "BlurImage")))
            }
        }.navigationBarTitle("UIViewWrapper")
    }
}

struct UIViewWrapperScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        UIViewWrapperScreen()
    }
}
#endif
