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
                Section(header: Text("Sections")) {
                    #if os(iOS)
                    ListNavigationLink(destination: CamerasScreen()) {
                        Label("Cameras", image: .camera)
                    }
                    #endif
                    
                    ListNavigationLink(destination: DataScreen()) {
                        Label("Data", image: .data)
                    }
                    ListNavigationLink(destination: ExtensionsScreen()) {
                        Label("Extensions", image: .extensions)
                    }
                    ListNavigationLink(destination: GesturesScreen()) {
                        Label("Gestures", image: .gestures)
                    }
                    
                    #if os(iOS)
                    ListNavigationLink(destination: PickersScreen()) {
                        Label("Pickers", image: .pickers)
                    }
                    #endif
                    
                    ListNavigationLink(destination: PresentationScreen()) {
                        Label("Presentation", image: .presentation)
                    }
                    
                    #if os(iOS)
                    ListNavigationLink(destination: SharingScreen()) {
                        Label("Sharing", image: .sharing)
                    }
                    #endif
                    
                    ListNavigationLink(destination: StylesScreen()) {
                        Label("Styles", image: .styles)
                    }
                    ListNavigationLink(destination: ViewsScreen()) {
                        Label("Views", image: .views)
                    }
                }
            }
            .navigationBarTitle(("SwiftUIKit"))
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
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
