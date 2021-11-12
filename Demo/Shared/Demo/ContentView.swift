//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    #if os(iOS)
                    ListNavigationLinkItem(destination: BlursScreen()) {
                        Label("Blurs", image: .blur)
                    }
                    ListNavigationLinkItem(destination: CamerasScreen()) {
                        Label("Cameras", image: .camera)
                    }
                    #endif
                    
                    ListNavigationLinkItem(destination: DataScreen()) {
                        Label("Data", image: .data)
                    }
                    ListNavigationLinkItem(destination: ExtensionsScreen()) {
                        Label("Extensions", image: .extensions)
                    }
                    ListNavigationLinkItem(destination: GesturesScreen()) {
                        Label("Gestures", image: .gestures)
                    }
                    
                    #if os(iOS)
                    ListNavigationLinkItem(destination: PickersScreen()) {
                        Label("Pickers", image: .pickers)
                    }
                    #endif
                    
                    ListNavigationLinkItem(destination: PresentationScreen()) {
                        Label("Presentation", image: .presentation)
                    }
                    
                    #if os(iOS)
                    ListNavigationLinkItem(destination: SharingScreen()) {
                        Label("Sharing", image: .sharing)
                    }
                    #endif
                    
                    ListNavigationLinkItem(destination: StylesScreen()) {
                        Label("Styles", image: .styles)
                    }
                    ListNavigationLinkItem(destination: ViewsScreen()) {
                        Label("Views", image: .views)
                    }
                }
            }
            .navigationBarTitle(("SwiftUIKit"))
            .withPlatformSpecificNavigationMode()
        }
        .withPlatformSpecificNavigationStyle()
    }
}

private extension View {
    
    func withPlatformSpecificNavigationStyle() -> some View {
        #if os(iOS)
        return self
            .navigationViewStyle(StackNavigationViewStyle())
        #else
        return self
        #endif
    }
    
    func withPlatformSpecificNavigationMode() -> some View {
        #if os(iOS)
        return self
            .navigationBarTitleDisplayMode(.inline)
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
