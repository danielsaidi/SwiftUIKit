//
//  ListShelfSectionStyle.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This style can be used to style a ``ListShelfSection``.
public struct ListShelfSectionStyle {
    
    /// Create a custom list shelf section style.
    ///
    /// - Parameters:
    ///   - horizontalPadding: The horizontal edge padding to apply, by default `16`.
    ///   - rowSpacing: The spacing to apply between each row, by default `16`.
    ///   - rowTitleSpacing: The bottom padding to apply to each row title, by default `0`.
    ///   - rowItemSpacing: The spacing to apply between each row item, by default `16`.
    public init(
        horizontalPadding: Double = 16,
        rowSpacing: Double = 16,
        rowTitleSpacing: Double = 10,
        rowItemSpacing: Double = 16
    ) {
        self.horizontalPadding = horizontalPadding
        self.rowSpacing = rowSpacing
        self.rowTitleSpacing = rowTitleSpacing
        self.rowItemSpacing = rowItemSpacing
    }
    
    /// The horizontal edge padding to apply.
    public var horizontalPadding: Double
    
    /// The spacing to apply between each row.
    public var rowSpacing: Double
    
    /// The bottom padding to apply to each row title.
    public var rowTitleSpacing: Double
    
    /// The spacing to apply between each row item.
    public var rowItemSpacing: Double
}

public extension ListShelfSectionStyle {
    
    /// The standard list sheld section style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``ListShelfSectionStyle`` style to the view.
    func listShelfSectionStyle(
        _ style: ListShelfSectionStyle
    ) -> some View {
        self.environment(\.listShelfSectionStyle, style)
    }
}

private extension ListShelfSectionStyle {

    @MainActor struct Key: @preconcurrency EnvironmentKey {

        public static var defaultValue: ListShelfSectionStyle {
            .standard
        }
    }
}

public extension EnvironmentValues {

    var listShelfSectionStyle: ListShelfSectionStyle {
        get { self [ListShelfSectionStyle.Key.self] }
        set { self [ListShelfSectionStyle.Key.self] = newValue }
    }
}
