//
//  CornerRadiusStyleCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct CornerRadiusStyleCell: View {
    
    let title: String
    let color: Color
    let style: CornerRadiusStyle
    
    var body: some View {
        DemoListCell(
            title: title,
            content: color,
            cornerRadius: style,
            effect: effect
        )
    }
}

private extension CornerRadiusStyleCell {
    
    func effect(_ view: AnyView) -> some View {
        view
    }
}

struct CornerRadiusStyleCell_Previews: PreviewProvider {
    static var previews: some View {
        CornerRadiusStyleCell(
            title: "Hi!",
            color: .red,
            style: CornerRadiusStyle(radius: 5)
        )
    }
}
