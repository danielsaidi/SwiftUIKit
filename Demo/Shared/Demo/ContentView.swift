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
            MenuList("SwiftUIKit") {
                Section {
                    #if os(iOS)
                    MenuListLink("Blurs", .blur, destination: BlursScreen())
                    MenuListLink("Cameras", .camera, destination: CamerasScreen())
                    #endif
                    MenuListLink("Data", .data, destination: DataScreen())
                    MenuListLink("Extensions", .extensions, destination: ExtensionsScreen())
                    MenuListLink("Gestures", .gestures, destination: GesturesScreen())
                    #if os(iOS)
                    MenuListLink("Pickers", .pickers, destination: PickersScreen())
                    #endif
                    MenuListLink("Presentation", .presentation, destination: PresentationScreen())
                    #if os(iOS)
                    MenuListLink("Sharing", .sharing, destination: SharingScreen())
                    #endif
                    MenuListLink("Styles", .styles, destination: StylesScreen())
                    MenuListLink("Views", .views, destination: ViewsScreen())
                }
            }.navigationBarTitleDisplayMode(.inline)
        }.withPlatformSpecificNavigationStyle()
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
