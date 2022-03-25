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
                ListText("SwiftUIKit has utils that make it easier to present certain kind of content in SwiftUI.")
            }
            
            Section(header: Text("Presentation Types")) {
                ListNavigationLink(destination: AlertsScreen()) {
                    Label("Alerts", image: .alert)
                }
                #if os(iOS) || os(tvOS) || os(watchOS)
                ListNavigationLink(destination: CoversScreen()) {
                    Label("Full covers", image: .cover)
                }
                #endif
                ListNavigationLink(destination: SheetsScreen()) {
                    Label("Sheets", image: .sheet)
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
