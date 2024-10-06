//
//  LinkText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-31.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//
//  Original: https://stackoverflow.com/questions/73133551
//

#if os(iOS) || os(macOS) || os(watchOS)
import SwiftUI

public extension LinkText {

    /// This style can be applied to a ``LinkText`` and will
    /// apply to all links within the view.
    ///
    /// There are some built-in styles like ``standard`` and
    /// ``plain``. You can also create your own.
    ///
    /// To style colors, plain texts in a ``LinkText`` apply
    /// the currently applied `.foregroundColor` while links
    /// use the currently applied `.accentColor`. The entire
    /// component will also use other native modifiers, like
    /// `.lineSpacing`.
    struct Style {

        public init(
            fontWeight: Font.Weight = .regular,
            underline: Bool = true
        ) {
            self.fontWeight = fontWeight
            self.underline = underline
        }

        public var fontWeight: Font.Weight
        public var underline: Bool
    }
}

public extension LinkText.Style {
    
    /// The standard link text style.
    static var standard: Self { .init() }

    /// A plain link text style that doesn't underline links.
    static var plain: Self { .init(underline: false) }
}

public extension View {

    /// Apply a ``LinkText/Style`` to the view.
    func linkTextStyle(
        _ style: LinkText.Style
    ) -> some View {
        self.environment(\.linkTextStyle, style)
    }
}

private extension LinkText.Style {

    struct Key: EnvironmentKey {

        public static var defaultValue: LinkText.Style {
            .standard
        }
    }
}

public extension EnvironmentValues {

    var linkTextStyle: LinkText.Style {
        get { self [LinkText.Style.Key.self] }
        set { self [LinkText.Style.Key.self] = newValue }
    }
}

#endif
