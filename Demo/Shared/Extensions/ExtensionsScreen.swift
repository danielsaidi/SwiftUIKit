//
//  ExtensionsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ExtensionsScreen: View {
    var body: some View {
        DemoList("Extensions") {
            Section {
                DemoListText("""
SwiftUIKit contains a bunch of extensions that makes using SwiftUI easier.
                    
Since this namespace will grow, extensions are not demonstrated. Instead, some are used in the demo examples.
""")
            }
        }
    }
}

struct ExtensionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionsScreen()
    }
}
