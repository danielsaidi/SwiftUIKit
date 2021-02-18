//
//  StylesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct StylesScreen: View {
 
    var body: some View {
        MenuList("Gestures") {
            Section {
                MenuListText("SwiftUIKit has styles that make it easier to define and apply custom styles.")
            }
            
            Section(header: Text("Styles")) {
                MenuListLink("Corner Radius", .cornerRadius, destination: CornerRadiusStyleScreen())
                #if os(iOS) || os(tvOS)
                MenuListLink("Fonts", .font, destination: FontStyleScreen())
                #endif
                MenuListLink("Shadows", .shadow, destination: ShadowStyleScreen())
            }
        }
    }
}

struct StylesScreen_Previews: PreviewProvider {
    static var previews: some View {
        StylesScreen()
    }
}
