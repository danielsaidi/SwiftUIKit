//
//  BlurCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2019-09-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct BlurCell: View {
    let style: UIBlurEffect.Style
    
    var body: some View {
        DemoListItem(
            title: style.displayName,
            content: image,
            effect: effect)
    }
}

private extension BlurCell {
    
    var image: some View {
        Image("BlurImage")
            .resizable()
            .blur(style)
    }
    
    func effect(_ view: AnyView) -> some View {
        view
    }
}

struct BlurCell_Previews: PreviewProvider {
    static var previews: some View {
        BlurCell(style: .regular)
    }
}
