//
//  StylesScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct StylesScreen: View {
    
    var body: some View {
        List {
            NavigationLink("Corner Radius Style", destination: CornerRadiusStyleScreen())
            NavigationLink("Font Style", destination: FontStyleScreen())
            NavigationLink("Shadow Style", destination: ShadowStyleScreen())
        }.navigationBarTitle("Styles")
    }
}

struct StylesScreen_Previews: PreviewProvider {
    static var previews: some View {
        StylesScreen()
    }
}
