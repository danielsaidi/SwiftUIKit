//
//  ExtensionsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ExtensionsScreen: View {
 
    var body: some View {
        List {
            Section {
                Text("""
SwiftUIKit contains a bunch of extensions that aim at making it easier to work with SwiftUI.
                    
Since this namespace contains a lot will grow over time, extensions are not demonstrated. Instead, checkout the library source code.
""")
            }
        }.navigationTitle("Extensions")
    }
}

struct ExtensionsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ExtensionsScreen()
        }
    }
}
