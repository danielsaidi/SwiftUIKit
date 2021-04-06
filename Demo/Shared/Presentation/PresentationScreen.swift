//
//  PresentationScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct PresentationScreen: View {
 
    var body: some View {
        MenuList("Presentation") {
            Section {
                MenuListText("SwiftUIKit has utils that make it easier to present certain kind of content in SwiftUI.")
            }
            
            Section(header: Text("Presentation Types")) {
                MenuListItem(icon: .alert, title: "Alerts").navigationLink(to: AlertsScreen())
                #if os(iOS) || os(tvOS) || os(watchOS)
                MenuListItem(icon: .cover, title: "Full Screen Covers").navigationLink(to: CoversScreen())
                #endif
                MenuListItem(icon: .sheet, title: "Sheets").navigationLink(to: SheetsScreen())
                MenuListItem(icon: .toast, title: "Toasts").navigationLink(to: ToastsScreen())
            }
        }
    }
}

struct PresentationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PresentationScreen()
        }
    }
}
