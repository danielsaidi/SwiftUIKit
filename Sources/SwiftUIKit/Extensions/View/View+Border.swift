//
//  View+Border.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Adds a border to with a certain content (for instance a
     certain `Color`), width and corner radius.
     */
    func border<Content: ShapeStyle>(
        _ content: Content,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 0
    ) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder(content, lineWidth: width)
        )
    }
}
