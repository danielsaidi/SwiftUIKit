//
//  AlertsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct AlertsScreen: View {
    
    @StateObject private var context = AlertContext()
    
    var body: some View {
        DemoList("Alerts") {
            ForEach(DemoPresentable.allCases) { item in
                DemoListButton(item.listText(for: "alert"), item.listIcon) {
                    present(item)
                }
            }
        }.alert(context: context)
    }
}

private extension AlertsScreen {
    
    func present(_ presentable: DemoPresentable) {
        context.present(presentable)
    }
}

struct AlertsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlertsScreen()
    }
}
