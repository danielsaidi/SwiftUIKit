//
//  ToastsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ToastsScreen: View {
    
    @StateObject private var context = ToastContext()
    
    var body: some View {
        List {
            Section {
                ListTextItem("SwiftUIKit has utils that make it easier to manage and present toasts.")
            }
            
            Section(header: Text("Actions")) {
                ForEach(DemoPresentable.allCases) { item in
                    ListButtonItem(action: { present(item) }) {
                        Label(item.listText(for: "toast"), image: item.listIcon)
                    }
                }
            }
        }
        .navigationBarTitle("Toasts")
        .toast(context: context, duration: 5, style: .standard)
    }
}

private extension ToastsScreen {
    
    func present(_ presentable: DemoPresentable) {
        context.present(presentable)
    }
}

struct ToastsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ToastsScreen()
    }
}
