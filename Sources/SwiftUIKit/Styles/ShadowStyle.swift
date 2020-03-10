//
//  ShadowStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct represents a style with properties that matches
 the `SwiftUI`s `shadow` modifier.
 
 You can use the style properties together with the standard
 modifier or use the `shadow(_ style:)` `View` extension.
 
 You can specify your own standard styles by creating static,
 calculated `ShadowStyle` extension properties.
 */
public struct ShadowStyle {
    
    public init(
        color: Color = .black,
        radius: CGFloat,
        x: CGFloat,
        y: CGFloat) {
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
