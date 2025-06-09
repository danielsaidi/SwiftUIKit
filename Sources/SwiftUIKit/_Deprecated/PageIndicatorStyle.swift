//
//  PageIndicatorStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-30.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
public struct PageIndicatorStyle: Equatable {
    
    /// Create a custom page indicator style.
    ///
    /// - Parameters:
    ///   - dotColor: The indicator dot color, by default `.white` with 0.5 opacity.
    ///   - dotSize: The indicator dot size, by default `10`.
    ///   - currentDotColor: The indicator current dot color, by default `.white`.
    ///   - currentDotSize: The indicator current dot size, by default `10`.
    ///   - dotSpacing: The spacing to apply between dots, by default `nil`.
    ///   - isAnimated: Whether or not changing pages is animated, by default `true`.
    public init(
        dotColor: Color = .white.opacity(0.5),
        dotSize: CGFloat = 7,
        dotSpacing: CGFloat? = nil,
        currentDotColor: Color = .white,
        currentDotSize: CGFloat = 7,
        isAnimated: Bool = true
    ) {
        self.dotColor = dotColor
        self.dotSize = dotSize
        self.dotSpacing = dotSpacing
        self.currentDotColor = currentDotColor
        self.currentDotSize = currentDotSize
        self.isAnimated = isAnimated
    }
    
    /// The indicator current dot color.
    public var currentDotColor: Color
    
    /// The indicator current dot size.
    public var currentDotSize: CGFloat
    
    /// The indicator dot color.
    public var dotColor: Color
    
    /// The indicator dot size.
    public var dotSize: CGFloat
    
    /// The spacing to apply between dots.
    public var dotSpacing: CGFloat?
    
    /// Whether or not changing pages is animated.
    public var isAnimated: Bool
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
public extension PageIndicatorStyle {

    /// The standard page indicator style.
    static var standard: Self { .init() }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
public extension View {

    /// Apply a ``PageIndicatorStyle`` style to the view.
    func pageIndicatorStyle(
        _ style: PageIndicatorStyle
    ) -> some View {
        self.environment(\.pageIndicatorStyle, style)
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
private extension PageIndicatorStyle {

    @MainActor struct Key: @preconcurrency EnvironmentKey {

        public static var defaultValue: PageIndicatorStyle {
            .standard
        }
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
public extension EnvironmentValues {

    var pageIndicatorStyle: PageIndicatorStyle {
        get { self [PageIndicatorStyle.Key.self] }
        set { self [PageIndicatorStyle.Key.self] = newValue }
    }
}
