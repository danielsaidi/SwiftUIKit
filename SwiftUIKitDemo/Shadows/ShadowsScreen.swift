//
//  ShadowsScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ShadowsScreen: View, DemoList {
    
    let crazy = ShadowStyle(
        color: .red, radius: 20, x: -5, y: 10)
    
    var body: some View {
        ScrollView {
            topSpacer
            VStack(spacing: listSpacing) {
                ShadowCell(title: "Toast shadow", color: .green, style: .standardToast)
                ShadowCell(title: "Demo shadow", color: .gray, style: crazy)
            }
        }.navigationBarTitle("ShadowStyle")
    }
}

struct ShadowsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShadowsScreen()
    }
}
