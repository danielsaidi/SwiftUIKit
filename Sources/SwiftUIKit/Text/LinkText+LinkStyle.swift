//
//  LinkText+LinkStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-31.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//
//  Original: https://stackoverflow.com/questions/73133551
//

import SwiftUI

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

public extension View {

    /// Apply a ``LinkText/LinkStyle`` to the view.
    func linkTextLinkStyle(
        _ style: LinkText.LinkStyle
    ) -> some View {
        self.environment(\.linkTextLinkStyle, style)
    }
}

private extension LinkText.LinkStyle {

    struct Key: EnvironmentKey {

        static var defaultValue: LinkText.LinkStyle {
            .standard
        }
    }
}

public extension EnvironmentValues {

    var linkTextLinkStyle: LinkText.LinkStyle {
        get { self [LinkText.LinkStyle.Key.self] }
        set { self [LinkText.LinkStyle.Key.self] = newValue }
    }
}
