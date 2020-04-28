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
            SwiftUIKit contains extensions to SwiftUI components, e.g. re-applying safe area insets within a parent that ignores them, type erasures etc.

            Since this namespace will probably grow much, individual extensions are not listed or demonstrated here. Instead, have a look at the source code to see what kind of extensions this library contains. They should all be pretty well documented.
            """).lineLimit(1000)
                .padding()
        }.navigationBarTitle("Extensions")
    }
}

struct ExtensionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionsScreen()
    }
}
