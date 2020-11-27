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
                DemoListLink("Cameras", .camera, CamerasScreen())
                #endif
                DemoListLink("Data", .data, DataScreen())
                DemoListLink("Extensions", .extensions, ExtensionsScreen())
                #if os(iOS)
                DemoListLink("Gestures", .gestures, GesturesScreen())
                DemoListLink("Pickers", .pickers, PickersScreen())
                #endif
                DemoListLink("Presentation", .presentation, PresentationScreen())
                #if os(iOS)
                DemoListLink("Sharing", .sharing, SharingScreen())
                #endif
                DemoListLink("Styles", .styles, StylesScreen())
                DemoListLink("Views", .views, ViewsScreen())
            }
        }.withPlatformSpecificNavigationStyle()
    }
}

private extension View {
    
    func withPlatformSpecificNavigationStyle() -> some View {
        #if os(iOS)
        return self.navigationViewStyle(StackNavigationViewStyle())
        #else
        return self
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
