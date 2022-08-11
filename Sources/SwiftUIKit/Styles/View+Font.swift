//
//  View+Font.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

public extension View {
    
    /**
     Apply a custom font with a certain `name`, `style` and
     font `weight`.
     */
    func font(
        name: String,
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular
    ) -> some View {
        font(FontStyle(
            name: name,
            style: style,
            weight: weight)
        )
    }
    
    /**
     Apply a custom font with a certain `identifier`, `style`
     and font `weight`.
     */
    func font(
        identifier: FontIdentifier,
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular
    ) -> some View {
        font(
            name: identifier.fontName,
            style: style,
            weight: weight
        )
    }
    
    /**
     Apply a ``FontStyle`` to the view.
     */
    func font(_ style: FontStyle) -> some View {
        font(style.font)
    }
}
#endif
