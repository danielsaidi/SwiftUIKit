//
//  ListCardStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This style can be used to style a ``Card``.
public struct CardStyle {

    /// Create a list card style
    ///
    /// - Parameters:
    ///   - cornerRadius: The corner radius to apply, by default `8.0`.
    ///   - shadowStyle: The shadowStyle to apply, by default ``ViewShadowStyle/card``.
    public init(
        cornerRadius: Double = 8.0,
        shadowStyle: ViewShadowStyle = .card
    ) {
        self.cornerRadius = cornerRadius
        self.shadowStyle = shadowStyle
    }

    /// The corner radius to apply.
    public var cornerRadius: Double

    /// The shadow style to apply.
    public var shadowStyle: ViewShadowStyle
}

public extension CardStyle {

    /// The standard list card style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``CardStyle`` style to the view.
    func cardStyle(
        _ style: CardStyle
    ) -> some View {
        self.environment(\.cardStyle, style)
    }
}

private extension CardStyle {

    struct Key: EnvironmentKey {

        public static var defaultValue: CardStyle {
            .standard
        }
    }
}

public extension EnvironmentValues {

    var cardStyle: CardStyle {
        get { self [CardStyle.Key.self] }
        set { self [CardStyle.Key.self] = newValue }
    }
}
