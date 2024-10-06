//
//  CircularProgressBar+Style.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-26.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension CircularProgressBar {

    /// This type can style a ``CircularProgressBar``.
    struct Style {

        public init(
            animation: Animation = .bouncy,
            backgroundColor: Color = Color.black.opacity(0.9),
            decimals: Int = 0,
            progressColor: Color = .white,
            progressWidth: CGFloat = 8,
            progressModifier: @escaping ViewModifier = { $0 },
            showTitle: Bool = true,
            startAngle: Double = 0,
            strokeColor: Color = .black,
            strokeWidth: CGFloat = 2,
            titleColor: Color = .white,
            titleFont: Font = Font.body.bold(),
            titleModifier: @escaping ViewModifier = { $0 }
        ) {
            self.animation = animation
            self.backgroundColor = backgroundColor
            self.decimals = decimals
            self.progressColor = progressColor
            self.progressWidth = progressWidth
            self.progressModifier = progressModifier
            self.showTitle = showTitle
            self.startAngle = startAngle
            self.strokeColor = strokeColor
            self.strokeWidth = strokeWidth
            self.titleColor = titleColor
            self.titleFont = titleFont
            self.titleModifier = titleModifier
        }

        public typealias ViewModifier = (AnyView) -> AnyView

        public var animation: Animation
        public var backgroundColor: Color
        public var decimals: Int
        public var progressColor: Color
        public var progressWidth: CGFloat
        public var progressModifier: ViewModifier
        public var showTitle: Bool
        public var startAngle: Double
        public var strokeColor: Color
        public var strokeWidth: CGFloat
        public var titleColor: Color
        public var titleFont: Font
        public var titleModifier: ViewModifier
    }
}

public extension CircularProgressBar.Style {

    /// The standard circular progress bar style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``CircularProgressBar/Style`` to the view.
    func circularProgressBarStyle(
        _ style: CircularProgressBar.Style
    ) -> some View {
        self.environment(\.circularProgressBarStyle, style)
    }
}

private extension CircularProgressBar.Style {

    struct Key: EnvironmentKey {

        public static var defaultValue: CircularProgressBar.Style {
            .standard
        }
    }
}

public extension EnvironmentValues {

    var circularProgressBarStyle: CircularProgressBar.Style {
        get { self [CircularProgressBar.Style.Key.self] }
        set { self [CircularProgressBar.Style.Key.self] = newValue }
    }
}
