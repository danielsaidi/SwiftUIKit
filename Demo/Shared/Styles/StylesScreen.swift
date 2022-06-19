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
        List {
            ListHeader("""
SwiftUIKit has styles that make it easier to define and apply custom styles.
""")
            
            Section(header: Text("Styles")) {
                ListNavigationLink(destination: CornerRadiusStyleScreen()) {
                    Label("Corner Radius", image: .cornerRadius)
                }
                #if os(iOS) || os(tvOS)
                ListNavigationLink(destination: FontStyleScreen()) {
                    Label("Fonts", image: .font)
                }
                #endif
                ListNavigationLink(destination: ViewShadowStyleScreen()) {
                    Label("Shadows", image: .shadow)
                }
            }
        }.navigationTitle("Gestures")
    }
}

struct StylesScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        StylesScreen()
    }
}
