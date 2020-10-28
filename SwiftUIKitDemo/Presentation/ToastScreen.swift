//
//  ToastScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ToastsScreen: View, DemoList {
    
    @StateObject var context = ToastContext()
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                itemUsingView(.text, color: .red)
                itemUsingView(.flag, color: .green)
                itemUsingProvider(.emojis, color: .blue)
            }
        }
        .toast(context: context, style: .standard)
        .navigationBarTitle("Toasts")
    }
}

private extension ToastsScreen {
    
    func itemUsingProvider(_ toast: DemoToast, color: Color) -> some View {
        let title = "Show a \(toast.title) toast"
        let action = { self.context.present(toast) }
        return DemoListItem(title: title, content: color, effect: { $0 })
            .onTapGesture(perform: action)
    }
    
    func itemUsingView(_ toast: DemoToast, color: Color) -> some View {
        let title = "Show a \(toast.title) toast"
        let action = { self.context.present(toast.toast) }
        return DemoListItem(title: title, content: color, effect: { $0 })
            .onTapGesture(perform: action)
    }
}

struct ToastScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToastsScreen()
    }
}
