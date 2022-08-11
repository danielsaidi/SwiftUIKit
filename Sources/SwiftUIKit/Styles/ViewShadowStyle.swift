//
//  ShadowStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "ShadowStyle has been renamed to ViewShadowStyle to not conflict with the new SwiftUI 4 ShadowStyle.")
public typealias X = ViewShadowStyle

/**
 This struct represents a style with properties that matches
 the `SwiftUI`s `shadow` modifier.
 
 You can use the style properties together with the standard
 modifier or use the `shadow(_ style:)` `View` extension.
 
 You can specify your own standard styles by creating static,
 calculated extension properties, for instance:
 
 ```swift
 extension CornerRadiusStyle {
 
     static let badge = ShadowStyle(
         color: Color.black.opacity(0.1),
         radius: 3,
         x: 0,
         y: 2)
 }
 ```
 */
public struct ViewShadowStyle {
    
    public init(
        color: Color = .black,
        radius: CGFloat,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
    
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
}

public extension ViewShadowStyle {
    
    /**
     This style does not apply anything and can be used when
     a style is required, but none is desired.
     
     You can set this style to another style value to change
     its default look.
     */
    static var none = ViewShadowStyle(color: .clear, radius: 0, x: 0, y: 0)
    
    /**
     This style represents a badge or "sticker" and is meant
     to make the view look as if it's attached to the parent
     view, but be in a separate layer.
     
     You can set this style to another style value to change
     its default look.
     */
    static var badge = ViewShadowStyle(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    
    /**
     This style represents a shadow that is cast from a view
     that elevates above the parent view.
     
     You can set this style to another style value to change
     its default look.
     */
    static var elevated = ViewShadowStyle(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
}

struct ShadowStyle_Previews: PreviewProvider {
    
    static func item() -> some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.white)
            .frame(width: 100, height: 100)
    }
    
    static var previews: some View {
        VStack(spacing: 20) {
            item().shadow(.none)
            item().shadow(.badge)
            item().shadow(.elevated)
        }
        .padding()
        .background(Color.gray.opacity(0.4))
    }
}
