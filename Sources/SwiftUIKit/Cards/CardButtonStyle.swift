//
//  CardButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This style can be used to style a ``Card``.
public struct CardButtonStyle: ButtonStyle {

    /// Create a list card button style
    ///
    /// - Parameters:
    ///   - animation: The animation to apply when the button is pressed, by default `.linear`.
    ///   - pressedScale: The scale to apply when the button is pressed, by default `0.98`.
    public init(
        animation: Animation? = nil,
        pressedScale: Double? = nil
    ) {
        self.animation = animation
        self.pressedScale = pressedScale ?? 0.98
    }
    
    /// The animation to apply when the button is pressed.
    public var animation: Animation?
    
    /// The scale to apply when the button is pressed.
    public var pressedScale: Double

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? pressedScale : 1)
            .animation(animation, value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == CardButtonStyle {

    /// The standard list card button style.
    static var card: CardButtonStyle { .init() }

    /// A custom list card button style.
    static func card(
        animation: Animation? = nil,
        pressedScale: Double? = nil
    ) -> Self {
        .init(
            animation: animation,
            pressedScale: pressedScale
        )
    }
}
