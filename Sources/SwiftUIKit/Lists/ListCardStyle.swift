//
//  ListCardStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This style can be used to style a ``ListCard``.
public struct ListCardStyle {

    /// Create a list card style
    ///
    /// - Parameters:
    ///   - cornerRadius: The corner radius to apply, by default `8.0`.
    ///   - shadowStyle: The shadowStyle to apply, by default ``ViewShadowStyle/listCard``.
    public init(
        cornerRadius: Double = 8.0,
        shadowStyle: ViewShadowStyle = .listCard
    ) {
        self.cornerRadius = cornerRadius
        self.shadowStyle = shadowStyle
    }

    /// The corner radius to apply.
    public var cornerRadius: Double

    /// The shadow style to apply.
    public var shadowStyle: ViewShadowStyle
}

public extension ListCardStyle {

    /// The standard list card style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``ListCardStyle`` style to the view.
    func listCardStyle(
        _ style: ListCardStyle
    ) -> some View {
        self.environment(\.listCardStyle, style)
    }
}

private extension ListCardStyle {

    struct Key: EnvironmentKey {

        public static var defaultValue: ListCardStyle {
            .standard
        }
    }
}

public extension EnvironmentValues {

    var listCardStyle: ListCardStyle {
        get { self [ListCardStyle.Key.self] }
        set { self [ListCardStyle.Key.self] = newValue }
    }
}
