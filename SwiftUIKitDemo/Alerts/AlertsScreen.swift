//
//  AlertsScreen swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct AlertsScreen: View, DemoList {
    
    @ObservedObject private var context = AlertContext()
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                itemUsingAlertPresentable(.red)
                itemUsingAlertPresentable(.green)
                itemUsingAlert(.blue)
            }
        }
        .navigationBarTitle("Alerts")
        .alert(isPresented: $context.isActive, content: context.alert)
    }
}

private extension AlertsScreen {
    
    func itemUsingAlert(_ alert: DemoAlert) -> some View {
        let title = "Show a \(alert.title) alert"
        let action = { self.context.present(alert.alert) }
        return DemoListItem(title: title, content: alert.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
    
    func itemUsingAlertPresentable(_ alert: DemoAlert) -> some View {
        let title = "Show a \(alert.title) alert"
        let action = { self.context.present(alert) }
        return DemoListItem(title: title, content: alert.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
}


struct AlertsScreenPreviews: PreviewProvider {
    static var previews: some View {
        AlertsScreen()
    }
}
