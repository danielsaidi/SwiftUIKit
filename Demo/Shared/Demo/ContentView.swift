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
                Section(
                    header: Text("Sections"),
                    footer: Text("Note that the demo doesn't contain everything in the library. There are much more than is presented here, so have a look at the documentation and source code as well.")
                ) {
                    #if os(iOS)
                    NavigationLink(destination: CamerasScreen()) {
                        Label("Cameras", image: .camera)
                    }
                    #endif
                    
                    NavigationLink(destination: DataScreen()) {
                        Label("Data", image: .data)
                    }
                    NavigationLink(destination: ExtensionsScreen()) {
                        Label("Extensions", image: .extensions)
                    }
                    NavigationLink(destination: GesturesScreen()) {
                        Label("Gestures", image: .gestures)
                    }
                    
                    #if os(iOS)
                    NavigationLink(destination: PickersScreen()) {
                        Label("Pickers", image: .pickers)
                    }
                    #endif
                    
                    NavigationLink(destination: PresentationScreen()) {
                        Label("Presentation", image: .presentation)
                    }
                    
                    #if os(iOS)
                    NavigationLink(destination: SharingScreen()) {
                        Label("Sharing", image: .sharing)
                    }
                    #endif
                    
                    NavigationLink(destination: StylesScreen()) {
                        Label("Styles", image: .styles)
                    }
                    NavigationLink(destination: ViewsScreen()) {
                        Label("Views", image: .views)
                    }
                }
            }
            .navigationTitle(("SwiftUIKit"))
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
