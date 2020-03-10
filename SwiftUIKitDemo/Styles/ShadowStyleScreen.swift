//
//  ShadowStyleScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ShadowStyleScreen: View, DemoList {
    
    private let crazyRed = ShadowStyle(
        color: .red, radius: 20, x: -5, y: 10)
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                ShadowStyleCell(title: "Discrete", color: .green, style: .standardToast)
                ShadowStyleCell(title: "Crazy red", color: .gray, style: crazyRed)
            }
        }.navigationBarTitle("ShadowStyle")
    }
}

struct ShadowStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShadowStyleScreen()
    }
}
