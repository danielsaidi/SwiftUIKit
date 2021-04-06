//
//  StylesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct StylesScreen: View {
 
    var body: some View {
        MenuList("Gestures") {
            Section {
                MenuListText("SwiftUIKit has styles that make it easier to define and apply custom styles.")
            }
            
            Section(header: Text("Styles")) {
                MenuListItem(icon: .cornerRadius, title: "Corner Radius").navigationLink(to: CornerRadiusStyleScreen())
                #if os(iOS) || os(tvOS)
                MenuListItem(icon: .font, title: "Fonts").navigationLink(to: FontStyleScreen())
                #endif
                MenuListItem(icon: .shadow, title: "Shadows").navigationLink(to: ShadowStyleScreen())
            }
        }
    }
}

struct StylesScreen_Previews: PreviewProvider {
    static var previews: some View {
        StylesScreen()
    }
}
