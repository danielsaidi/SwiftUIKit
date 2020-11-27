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
        DemoList("Gestures") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit has styles that make it easier to define and apply custom styles.")
            }
            
            Section(header: Text("Styles")) {
                DemoListLink("Corner Radius", .cornerRadius, CornerRadiusStyleScreen())
                DemoListLink("Fonts", .font, FontStyleScreen())
                DemoListLink("Shadows", .shadow, ShadowStyleScreen())
            }
        }
    }
}

struct StylesScreen_Previews: PreviewProvider {
    static var previews: some View {
        StylesScreen()
    }
}
