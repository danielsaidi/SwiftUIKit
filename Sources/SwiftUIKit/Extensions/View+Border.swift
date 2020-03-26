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
     Adds a border to this view with a certain content (e.g.
     Color.white), width and corner radius.
     */
    func border<Content: ShapeStyle>(
        _ content: Content,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 0) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder(content, lineWidth: width)
        )
    }
}
