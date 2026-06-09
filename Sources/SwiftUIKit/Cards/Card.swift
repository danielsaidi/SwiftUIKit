//
//  Card.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can be used as floating list or grid card, and
/// lets you adjust its elevation and press animation.
///
/// The view wraps any content view and can be styled with a
/// corner radius and a shadow. You can also provide context
/// menu items to show when the card is long pressed.
///
/// The idea with the view is to get a universal way to wrap
/// any view and make it look like a card, like you get with
/// the `.card` button style on tvOS. And since tvOS already
/// has a `card` button style, the default ``CardButtonStyle``
/// in this package is not available on that platform.
public struct Card<Content: View, ContextMenuView: View>: View {

    /// Create a list card.
    ///
    /// - Parameters:
    ///   - content: The card content.
    public init(
        @ViewBuilder content: @escaping ContentBuilder
    ) where ContextMenuView == EmptyView {
        self.content = content
        self.contextMenu = { EmptyView() }
    }

    /// Create a list card with a context menu.
    ///
    /// - Parameters:
    ///   - content: The card content.
    ///   - contextMenu: The card context menu content.
    public init(
        @ViewBuilder content: @escaping ContentBuilder,
        @ViewBuilder contextMenu: @escaping ContextMenuBuilder
    ) {
        self.content = content
        self.contextMenu = contextMenu
    }

    public typealias ContentBuilder = () -> Content
    public typealias ContextMenuBuilder = () -> ContextMenuView

    private let content: ContentBuilder
    private let contextMenu: ContextMenuBuilder

    @Environment(\.cardStyle) private var style

    public var body: some View {
        content()
            #if os(iOS)
            .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: style.cornerRadius))
            #endif
            .background(Color.primary.colorInvert())
            .cornerRadius(style.cornerRadius)
            #if os(iOS) || os(macOS) || os(tvOS)
            .contextMenu(menuItems: contextMenu)
            #endif
            .shadow(style.shadowStyle)
    }
}

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

public extension EnvironmentValues {

    /// Applies a ``CardStyle`` to the view hierarchy.
    @Entry var cardStyle: CardStyle = .standard
}

public extension ViewShadowStyle {

    /// The standard list card shadow style.
    static var card: Self {
        .init(
            color: .black.opacity(0.2),
            radius: 2,
            x: 0,
            y: 2
        )
    }
}

#Preview {
    
    VStack {
        Group {
            Button {} label: {
                Card {
                    Color.red.frame(width: 200, height: 200)
                }
            }
            .buttonStyle(
                .card(
                    animation: .bouncy,
                    pressedScale: 0.9
                )
            )
            Button {} label: {
                Card {
                    Color.red.frame(width: 200, height: 200)
                } contextMenu: {
                    Button("Preview.Button") {}
                }
            }
        }
        .buttonStyle(.card)
        .padding(50)
        .background(Color.gray)
        .cornerRadius(20)
    }
}
