//
//  ShadowStyleCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ShadowStyleCell: View {
    
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

private extension ShadowStyleCell {
    
    func effect(_ view: AnyView) -> some View {
        view.shadow(style)
    }
}

struct ShadowStyleCell_Previews: PreviewProvider {
    static var previews: some View {
        ShadowStyleCell(
            title: "Hi!",
            color: .red,
            style: .standardToast
        )
    }
}
