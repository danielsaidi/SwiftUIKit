//
//  FontStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

/**
 This styles defines font properties, to allow strong typing.
 
 You can specify your own standard styles by creating static,
 calculated extension properties, for instance:
 
 ```swift
 extension FontStyle {
 
     static let theBestFont = Self(
         name: "Comic Sans",
         style: .largeTitle2,
         weight: .bold
     )
 }
 ```
 
 You can apply the style with the `.font(_ style:)` modifier.
 */
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

public extension View {

    /// Apply the provided ``FontStyle``.
    func font(_ style: FontStyle) -> some View {
        font(style.font)
    }
    
    @available(*, deprecated, message: "Use the style modifier instead.")
    func font(
        name: String,
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular
    ) -> some View {
        font(
            FontStyle(
                name: name,
                style: style,
                weight: weight
            )
        )
    }
}
#endif
