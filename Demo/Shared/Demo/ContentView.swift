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
            List {
                #if os(iOS)
                DemoListLink("Blurs", .blur, BlursScreen())
                #endif
                DemoListLink("Camera (not done)", .camera, CameraScreen())
                DemoListLink("Data (not done)", .data, DataScreen())
                DemoListLink("Extensions (not done)", .extensions, ExtensionsScreen())
                DemoListLink("Gestures (not done)", .gestures, GesturesScreen())
                DemoListLink("Pickers (not done)", .pickers, PickersScreen())
                DemoListLink("Presentation (not done)", .presentation, PresentationScreen())
                DemoListLink("Sharing (not done)", .sharing, SharingScreen())
                DemoListLink("Styles (not done)", .styles, StylesScreen())
                DemoListLink("Views (not done)", .views, ViewsScreen())
            }.navigationTitle("SwiftUIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
