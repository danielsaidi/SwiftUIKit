//
//  View+Font.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Apply a custom font with a certain `name`, `style` and
     font `weight`.
     */
    func font(
        name: String,
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular) -> some View {
        font(FontStyle(
            name: name,
            style: style,
            weight: weight)
        )
    }
    
    /**
     Apply a custom font of a certain `style`.
     */
    func font(_ style: FontStyle) -> some View {
        font(style.font)
    }
}
