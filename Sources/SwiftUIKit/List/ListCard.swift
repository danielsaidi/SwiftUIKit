//
//  ListCard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used as a floating card in lists and grids.

 The card can be styled with a corner radius and shadow, and
 can also be provided with a list of context menu items that
 will be presented when long pressing the card.
 */
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ListCard<Content: View, ContextMenuView: View>: View {

    /**
     Create a list card.

     - Parameters:
       - style: The style to apply, by default ``ListCardStyle/standard``.
       - content: The card content.
     */
    public init(
        style: ListCardStyle = .standard,
        @ViewBuilder content: @escaping ContentBuilder
    ) where ContextMenuView == EmptyView {
        self.style = style
        self.content = content
        self.contextMenu = { EmptyView() }
    }

    /**
     Create a list card with a context menu.

     - Parameters:
       - style: The style to apply, by default ``ListCardStyle/standard``.
       - content: The card content.
       - contextMenu: The card context menu content.
     */
    public init(
        style: ListCardStyle = .standard,
        @ViewBuilder content: @escaping ContentBuilder,
        @ViewBuilder contextMenu: @escaping ContextMenuBuilder
    ) {
        self.style = style
        self.content = content
        self.contextMenu = contextMenu
    }

    public typealias ContentBuilder = () -> Content
    public typealias ContextMenuBuilder = () -> ContextMenuView

    private let style: ListCardStyle

    @ViewBuilder
    private let content: ContentBuilder

    @ViewBuilder
    private let contextMenu: ContextMenuBuilder

    public var body: some View {
        content()
            .background(Color.primary.colorInvert())
            .cornerRadius(style.cornerRadius)
            .contextMenu(menuItems: contextMenu)
            .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: style.cornerRadius))
            .shadow(style.shadowStyle)
    }
}

/**
 This style can be used to style a ``ListCard``.
 */
public struct ListCardStyle {

    /**
     Create a list card style

     - Parameters:
       - cornerRadius: The corner radius to apply, by default `8.0`.
       - shadowStyle: The shadowStyle to apply, by default ``ViewShadowStyle/listCard``.
     */
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

    /**
     The standard list card style.

     You can change this style to affect the standard global
     style of the ``ListCard`` view.
     */
    static var standard = ListCardStyle()
}

/**
 This button styles can be used to scale down a ``ListCard``.
 */
public struct ListCardButtonStyle: ButtonStyle {

    /**
     Create a list card button style

     - Parameters:
       - pressedScale: The scale to apply when the button is pressed, by default `0.98`.
     */
    public init(pressedScale: Double = 0.98) {
        self.pressedScale = pressedScale
    }

    /// The scale to apply when the button is pressed.
    public var pressedScale: Double

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? pressedScale : 1)
    }
}

public extension ButtonStyle where Self == ListCardButtonStyle {

    /**
     The standard list card button style.

     You can change this style to affect the standard global
     style of the ``ListCard`` button view.
     */
    static var listCard: ListCardButtonStyle { .init() }

    /**
     A list card button style.
     */
    static func listCard(pressedScale: Double) -> ListCardButtonStyle {
        .init(pressedScale: pressedScale)
    }
}

public extension ViewShadowStyle {

    /**
     The standard list card shadow style.
     */
    static var listCard = ViewShadowStyle(
        color: .black.opacity(0.2),
        radius: 2,
        x: 0,
        y: 2
    )
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct ListCard_Previews: PreviewProvider {

    static var previews: some View {
        Button {
        } label: {
            ListCard {
                Color.red.frame(width: 200, height: 200)
            } contextMenu: {

            }
        }
        .buttonStyle(.listCard)
        .padding(50)
        .background(Color.gray)
        .cornerRadius(20)
    }
}
