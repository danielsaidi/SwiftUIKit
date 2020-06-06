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
            SwiftUIKit contains a bunch of extensions that makes using SwiftUI easier.

            Since this namespace will probably grow much and fast, extensions are not demonstrated in this app. Instead, have a look at code to see what extensions this library contains.
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
