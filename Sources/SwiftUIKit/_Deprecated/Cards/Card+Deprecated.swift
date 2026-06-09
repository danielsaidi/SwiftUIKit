//
//  Card+Deprecated.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2026-06-08.
//

import SwiftUI

@available(*, deprecated, renamed: "Card")
public typealias ListCard = Card

@available(*, deprecated, renamed: "CardButtonStyle")
public typealias ListCardButtonStyle = CardButtonStyle

@available(*, deprecated, renamed: "CardStyle")
public typealias ListCardStyle = CardStyle

public extension ViewShadowStyle {

    @available(*, deprecated, renamed: "card")
    static var listCard: Self { card }
}

public extension ButtonStyle where Self == CardButtonStyle {

    #if !os(tvOS)
    @available(*, deprecated, renamed: "card")
    static var listCard: CardButtonStyle { .card }
    #endif

    @available(*, deprecated, renamed: "card")
    static func listCard(
        animation: Animation? = nil,
        pressedScale: Double? = nil
    ) -> Self {
        .card(
            animation: animation,
            pressedScale: pressedScale
        )
    }
}

public extension View {

    @available(*, deprecated, renamed: "cardStyle")
    func listCardStyle(
        _ style: CardStyle
    ) -> some View {
        cardStyle(style)
    }
}

public extension EnvironmentValues {

    @available(*, deprecated, renamed: "cardStyle")
    var listCardStyle: CardStyle {
        get { cardStyle }
        set { cardStyle = newValue }
    }
}
