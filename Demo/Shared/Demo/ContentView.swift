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
            MenuList("SwiftUIKit") {
                Section {
                    #if os(iOS)
                    MenuListItem(icon: .blur, title: "Blurs").navigationLink(to: BlursScreen())
                    MenuListItem(icon: .camera, title: "Cameras").navigationLink(to: CamerasScreen())
                    #endif
                    MenuListItem(icon: .data, title: "Data").navigationLink(to: DataScreen())
                    MenuListItem(icon: .extensions, title: "Extensions").navigationLink(to: ExtensionsScreen())
                    MenuListItem(icon: .gestures, title: "Gestures").navigationLink(to: GesturesScreen())
                    #if os(iOS)
                    MenuListItem(icon: .pickers, title: "Pickers").navigationLink(to: PickersScreen())
                    #endif
                    MenuListItem(icon: .presentation, title: "Presentation").navigationLink(to: PresentationScreen())
                    #if os(iOS)
                    MenuListItem(icon: .sharing, title: "Sharing").navigationLink(to: SharingScreen())
                    #endif
                    MenuListItem(icon: .styles, title: "Styles").navigationLink(to: StylesScreen())
                    MenuListItem(icon: .views, title: "Views").navigationLink(to: ViewsScreen())
                }
            }.withPlatformSpecificNavigationMode()
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
