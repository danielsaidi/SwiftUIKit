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
        DemoList("Presentation") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit has utils that make it easier to present certain kind of content in SwiftUI.")
            }
            
            Section(header: Text("Features")) {
                DemoListLink("Alerts", .alert, AlertsScreen())
                #if os(iOS) || os(tvOS) || os(watchOS)
                DemoListLink("Full Screen Covers", .cover, CoversScreen())
                #endif
                DemoListLink("Sheets", .sheet, SheetsScreen())
                DemoListLink("Toasts", .toast, ToastsScreen())
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
