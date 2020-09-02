//
//  HomeScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Alerts", destination: AlertsScreen())
                NavigationLink("Blurs", destination: BlursScreen())
                NavigationLink("Data", destination: DataScreen())
                NavigationLink("Extensions", destination: ExtensionsScreen())
                NavigationLink("Gestures", destination: GesturesScreen())
                NavigationLink("Keyboard", destination: KeyboardAvoidingScreen())
                NavigationLink("Sheets", destination: SheetsScreen())
                NavigationLink("Styles", destination: StylesScreen())
                NavigationLink("Toasts", destination: ToastScreen())
            }.navigationBarTitle("SwiftUIKit Demo")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
