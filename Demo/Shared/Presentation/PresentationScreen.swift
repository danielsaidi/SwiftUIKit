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
            DemoListLink("Alerts", .alert, AlertsScreen())
            DemoListLink("Full Screen Covers", .cover, CoversScreen())
            DemoListLink("Sheets", .sheet, SheetsScreen())
            DemoListLink("Toasts", .toast, ToastsScreen())
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
