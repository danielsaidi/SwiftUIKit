//
//  PresentationScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct PresentationScreen: View {
    
    var body: some View {
        List {
            NavigationLink("Alerts", destination: AlertsScreen())
            NavigationLink("Full Screen Covers", destination: FullScreenCoversScreen())
            NavigationLink("Sheets", destination: SheetsScreen())
            NavigationLink("Toasts", destination: ToastsScreen())
        }.navigationBarTitle("Presentation")
    }
}

struct PresentationScreen_Previews: PreviewProvider {
    static var previews: some View {
        PresentationScreen()
    }
}
