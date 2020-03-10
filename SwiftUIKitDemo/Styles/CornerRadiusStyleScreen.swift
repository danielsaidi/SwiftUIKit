//
//  CornerRadiusStyleScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct CornerRadiusStyleScreen: View, DemoList {
    
    private let five = CornerRadiusStyle(radius: 5)
    private let ten = CornerRadiusStyle(radius: 10)
    private let twenty = CornerRadiusStyle(radius: 20)
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                CornerRadiusStyleCell(title: "5 points", color: .red, style: five)
                CornerRadiusStyleCell(title: "10 points", color: .green, style: ten)
                CornerRadiusStyleCell(title: "20 points", color: .blue, style: twenty)
            }
        }.navigationBarTitle("ShadowStyle")
    }
}

struct CornerRadiusStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        CornerRadiusStyleScreen()
    }
}
