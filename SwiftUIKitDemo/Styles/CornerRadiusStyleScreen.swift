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
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                cell(title: ".five", color: .red, style: .five)
                cell(title: ".ten", color: .green, style: .ten)
                cell(title: ".twenty", color: .blue, style: .twenty)
            }
        }.navigationBarTitle("CornerRadiusStyle")
    }
}

private extension CornerRadiusStyleScreen {
    
    func cell(title: String, color: Color, style: CornerRadiusStyle) -> some View {
        DemoListCell(title: title, content: color, effect: { $0.cornerRadius(style) })
    }
}

private extension CornerRadiusStyle {
    
    static var five: CornerRadiusStyle {
        CornerRadiusStyle(radius: 5)
    }
    
    static var ten: CornerRadiusStyle {
        CornerRadiusStyle(radius: 10)
    }
    
    static var twenty: CornerRadiusStyle {
        CornerRadiusStyle(radius: 20)
    }
}

struct CornerRadiusStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        CornerRadiusStyleScreen()
    }
}
