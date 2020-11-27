//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        NavigationView {
            DemoList("SwiftUIKit") {
                #if os(iOS)
                DemoListLink("Blurs", .blur, BlursScreen())
                #endif
                DemoListLink("Cameras", .camera, CamerasScreen())
                DemoListLink("Data", .data, DataScreen())
                DemoListLink("Extensions", .extensions, ExtensionsScreen())
                DemoListLink("Gestures", .gestures, GesturesScreen())
                DemoListLink("Pickers", .pickers, PickersScreen())
                DemoListLink("Presentation", .presentation, PresentationScreen())
                DemoListLink("Sharing", .sharing, SharingScreen())
                DemoListLink("Styles", .styles, StylesScreen())
                DemoListLink("Views", .views, ViewsScreen())
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
