//
//  LinkText+LinkStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-31.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//
//  Original: https://stackoverflow.com/questions/73133551
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/TextReplacements")
public extension LinkText {

    /// This style can be applied to a ``LinkText`` and will
    /// apply to all links within the view.
    ///
    /// This style can be applied by using the view modifier
    /// ``SwiftUICore/View/linkTextLinkStyle(_:)``.
    ///
    /// To style link color, line heights, etc. just use the
    /// standard SwiftUI view modifiers. A link will use the
    /// `.accentColor` while texts use the `.foregroundStyle`.
    struct LinkStyle {

        public init(
            bold: Bool = false,
            italic: Bool = false
        ) {
            self.bold = bold
            self.italic = italic
        }

        public var bold: Bool
        public var italic: Bool
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/TextReplacements")
public extension LinkText.LinkStyle {
    
    /// The standard, plain link text style.
    static var standard: Self { .init() }
    
    /// A bold link style.
    static var bold: Self { .init(bold: true) }
    
    /// A bold, italic link style.
    static var boldItalic: Self {
        .init(bold: true, italic: true)
    }
    
    /// An italic link style.
    static var italic: Self { .init(italic: true) }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/TextReplacements")
public extension View {

    /// Apply a ``LinkText/LinkStyle`` to the view.
    func linkTextLinkStyle(
        _ style: LinkText.LinkStyle
    ) -> some View {
        self.environment(\.linkTextLinkStyle, style)
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/TextReplacements")
private extension LinkText.LinkStyle {

    struct Key: EnvironmentKey {

        static var defaultValue: LinkText.LinkStyle {
            .standard
        }
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/TextReplacements")
public extension EnvironmentValues {

    var linkTextLinkStyle: LinkText.LinkStyle {
        get { self [LinkText.LinkStyle.Key.self] }
        set { self [LinkText.LinkStyle.Key.self] = newValue }
    }
}
