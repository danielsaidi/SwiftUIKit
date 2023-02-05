//
//  AlertsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct AlertsScreen: View {
    
    @StateObject private var context = AlertContext()
    
    var body: some View {
        List {
            Section {
                Text("SwiftUIKit has additional utils that make it easier to manage and present alerts.")
            }
            
            Section(header: Text("Actions")) {
                ForEach(DemoPresentable.allCases) { item in
                    NavigationButton(action: { present(item) }) {
                        Label(item.listText(for: "alert"), image: item.listIcon)
                    }
                }
            }
        }
        .alert(context)
        .navigationTitle("Alerts")
    }
}

private extension AlertsScreen {
    
    func present(_ presentable: DemoPresentable) {
        context.present(presentable)
    }
}

struct AlertsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            AlertsScreen()
        }
    }
}
