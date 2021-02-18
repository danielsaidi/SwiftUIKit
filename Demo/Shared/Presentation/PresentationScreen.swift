//
//  PresentationScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct PresentationScreen: View {
 
    var body: some View {
        MenuList("Presentation") {
            Section {
                MenuListText("SwiftUIKit has utils that make it easier to present certain kind of content in SwiftUI.")
            }
            
            Section(header: Text("Presentation Types")) {
                MenuListLink("Alerts", .alert, destination: AlertsScreen())
                #if os(iOS) || os(tvOS) || os(watchOS)
                MenuListLink("Full Screen Covers", .cover, destination: CoversScreen())
                #endif
                MenuListLink("Sheets", .sheet, destination: SheetsScreen())
                MenuListLink("Toasts", .toast, destination: ToastsScreen())
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
