//
//  ShadowCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ShadowCell: View {
    
    let title: String
    let color: Color
    let style: ShadowStyle
    
    var body: some View {
        DemoListCell(
            title: title,
            content: color,
            effect: effect
        )
    }
}

private extension ShadowCell {
    
    func effect(_ view: AnyView) -> some View {
        view.shadow(style)
    }
}

struct ShadowCell_Previews: PreviewProvider {
    static var previews: some View {
        ShadowCell(
            title: "Hi!",
            color: .red,
            style: .standardToast
        )
    }
}
