//
//  FontStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

@available(*, deprecated, message: "This is no longer used within the library and will be removed in the next major release.")
public struct FontStyle {
    
    public init(
        name: String,
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular
    ) {
        self.name = name
        self.style = style
        self.weight = weight
    }
    
    public let name: String
    public let style: UIFont.TextStyle
    public let weight: Font.Weight
    
    public var font: Font {
        .custom(name, size: size).weight(weight)
    }
    
    public var size: CGFloat {
        UIFont.preferredFont(forTextStyle: style).pointSize
    }
}
#endif
