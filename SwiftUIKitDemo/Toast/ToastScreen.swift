//
//  ToastScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ToastScreen: View, DemoList {
    
    @State private var isToastActive = false
    @State private var toastView: AnyView = EmptyView().any() {
        didSet { isToastActive = true }
    }
    
    var body: some View {
        ScrollView {
            topSpacer
            Text("HEJ").onTapGesture {
                self.toastView = Text("HOJ").any()
            }
        }
    }
}

private extension ToastScreen {
    
//    var cell1: some View {
//        DemoListCell(title: nil, content: <#T##_#>, effect: <#T##(AnyView) -> _#>)
//    }
}

struct ToastScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToastScreen()
    }
}
