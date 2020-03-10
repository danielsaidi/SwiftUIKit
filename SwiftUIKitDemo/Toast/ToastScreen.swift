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
            VStack(spacing: listSpacing) {
                ToastCell(
                    title: "Tap to show a text toast toast",
                    color: .red
                ).onTapGesture(perform: showTextToast)

                ToastCell(
                    title: "Tap to show a german flag toast",
                    color: .yellow
                ).onTapGesture(perform: showViewToast)
            }
        }.toast(
            isPresented: $isToastActive,
            content: toastView,
            background: Color.primary.colorInvert()
        ).navigationBarTitle("Toast")
    }
}

private extension ToastScreen {
    
    func showTextToast() {
        toastView = Text("This is a text toast").any()
    }
    
    func showViewToast() {
        toastView = VStack(spacing: 0) {
            Color.black.frame(width: 200, height: 50)
            Color.red.frame(width: 200, height: 50)
            Color.yellow.frame(width: 200, height: 50)
        }.any()
    }
}

struct ToastScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToastScreen()
    }
}
