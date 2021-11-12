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
        List {
            Section {
                ListTextItem("SwiftUIKit has utils that make it easier to present certain kind of content in SwiftUI.")
            }
            
            Section(header: Text("Presentation Types")) {
                ListNavigationLinkItem(destination: AlertsScreen()) {
                    Label("Alerts", image: .alert)
                }
                #if os(iOS) || os(tvOS) || os(watchOS)
                ListNavigationLinkItem(destination: CoversScreen()) {
                    Label("Full covers", image: .cover)
                }
                #endif
                ListNavigationLinkItem(destination: SheetsScreen()) {
                    Label("Sheets", image: .sheet)
                }
                ListNavigationLinkItem(destination: ToastsScreen()) {
                    Label("Toasts", image: .toast)
                }
            }
        }.navigationBarTitle("Presentation")
    }
}

struct PresentationScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            PresentationScreen()
        }
    }
}
