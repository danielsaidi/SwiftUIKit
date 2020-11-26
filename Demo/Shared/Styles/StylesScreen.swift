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
            DemoListLink("Corner Radius", .cornerRadius, CornerRadiusStyleScreen())
            DemoListLink("Fonts", .font, FontStyleScreen())
            DemoListLink("Shadows", .shadow, ShadowStyleScreen())
        }
    }
}

struct StylesScreen_Previews: PreviewProvider {
    static var previews: some View {
        StylesScreen()
    }
}
