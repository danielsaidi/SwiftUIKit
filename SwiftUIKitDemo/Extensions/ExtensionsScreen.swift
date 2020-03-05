//
//  ExtensionsScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ExtensionsScreen: View {
    var body: some View {
        ScrollView(.vertical) {
            Text("""
            `SwiftUIKit` contains additional logic in the form of extensions to `SwiftUI` components.

            Since this namespace will probably grow much and fast, extensions are not listed or described here. Instead, have a look at the source code to see what kind of extensions this library contains.
            """).lineLimit(1000)
                .padding(.top)
                .navigationBarTitle("Extensions")
        }
    }
}

struct ExtensionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionsScreen()
    }
}
