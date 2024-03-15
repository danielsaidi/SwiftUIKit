//
//  ListBadgeIcon.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-29.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This view mimics the color badge icons that can be found in
 e.g. System Settings lists on iOS.
 */
@available(iOS 16.0, macOS 13.0, *)
@available(*, deprecated, message: "This type has moved to https://github.com/danielsaidi/BadgeIcon")
public struct ListBadgeIcon: View {
    
    /**
     Create a system settings-like badge icon, with a custom
     badge color and a custom colored, filled icon.
     
     - Parameters:
       - icon: The image to use.
       - iconColor: The icon color, by default `semi-black` or `white`.
       - iconFill: The icon fill mode, by default `true`.
       - iconGradient: The icon gradient mode, by default `true`.
       - iconOffset: The icon offset, by default `.zero`.
       - iconPadding: The icon padding, by default `5`.
       - badgeColor: The badge color, by default `.white`.
       - badgeStrokeColor: The badge stroke color, if any.
       - size: The badge size, by default `32`.
     */
    public init(
        icon: Image,
        iconColor: Color? = nil,
        iconFill: Bool = true,
        iconGradient: Bool = true,
        iconOffset: CGPoint = .zero,
        iconPadding: Double = 5,
        badgeColor: Color = .white,
        badgeStrokeColor: Color? = nil,
        size: Double = 32
    ) {
        let whiteBadge = badgeColor == .white
        let whiteBadgeStroke: Color = .hex(0xe7e7e7)
        let fallbackIconColor = whiteBadge ? .black.opacity(0.8) : Color.white
        let fallbackStroke = whiteBadge ? whiteBadgeStroke : .clear
        
        self.icon = icon
        self.iconColor = iconColor ?? fallbackIconColor
        self.iconFill = iconFill
        self.iconGradient = iconGradient
        self.iconOffset = iconOffset
        self.iconPadding = iconPadding
        self.badgeColor = badgeColor
        self.badgeStrokeColor = badgeStrokeColor ?? fallbackStroke
        self.size = size
    }

    private let icon: Image
    private let badgeColor: Color
    private let badgeStrokeColor: Color
    private let iconColor: Color?
    private let iconGradient: Bool
    private let iconFill: Bool
    private let iconOffset: CGPoint
    private let iconPadding: Double
    private let size: Double

    public var body: some View {
        ZStack {
            badgeColor
                .asGradientBackground()
                .withStrokeColor(badgeStrokeColor)
                .aspectRatio(1, contentMode: .fit)
                
            icon.resizable()
                .aspectRatio(contentMode: .fit)
                .symbolVariant(iconFill ? .fill : .none)
                .padding(iconPadding)
                .offset(x: iconOffset.x, y: iconOffset.y)
                .foregroundColor(iconColor, gradientIf: iconGradient)
        }.frame(width: size, height: size)
    }
}

@available(iOS 16.0, macOS 13.0, *)
@available(*, deprecated, message: "This type has moved to https://github.com/danielsaidi/BadgeIcon")
public extension ListBadgeIcon {
    
    static var appStore: Self {
        .init(
            icon: Image(systemName: "apple.logo"),
            iconColor: .white.opacity(0.6),
            badgeColor: .black.opacity(0.9)
        )
    }
    
    static var bug: some View {
        ListBadgeIcon(
            icon: .symbol("ladybug")
        )
        .symbolRenderingMode(.multicolor)
    }
    
    static var email: Self {
        .init(
            icon: .symbol("envelope"),
            iconColor: .white,
            badgeColor: .blue
        )
    }
    
    static var featureRequest: some View {
        ListBadgeIcon(
            icon: .symbol("gift"),
            iconColor: .pink
        )
    }
    
    static var languageSettings: Self {
        .init(
            icon: .symbol("globe"),
            iconColor: .cyan
        )
    }
    
    static var lightbulb: some View {
        ListBadgeIcon(
            icon: .symbol("lightbulb"),
            iconColor: .yellow
        )
    }
    
    static var multicolorPalette: some View {
        ListBadgeIcon(
            icon: .symbol("paintpalette"),
            iconColor: nil
        )
        .symbolRenderingMode(.multicolor)
    }
    
    static var person: Self {
        .init(
            icon: .symbol("person")
        )
    }
    
    static var privacy: some View {
        ListBadgeIcon(
            icon: .symbol("checkmark.shield.fill"),
            iconColor: .green
        )
        .symbolRenderingMode(.multicolor)
    }
    
    static var prominentAlert: Self {
        .init(
            icon: .symbol("exclamationmark.triangle"),
            badgeColor: .orange
        )
    }
    
    static var prominentCheckmark: some View {
        ListBadgeIcon(
            icon: .symbol("checkmark"),
            iconPadding: 7,
            badgeColor: .green
        )
        .fontWeight(.semibold)
    }
    
    static var redHeart: Self {
        .init(
            icon: .symbol("heart"),
            iconColor: .red
        )
    }
    
    static var review: Self {
        .init(
            icon: .symbol("star")
        )
    }
    
    static var safari: some View {
        ListBadgeIcon(
            icon: .symbol("safari"),
            iconColor: .blue
        )
        .symbolRenderingMode(.multicolor)
    }
    
    static var share: Self {
        .init(
            icon: .symbol("square.and.arrow.up"),
            iconFill: false,
            iconOffset: .init(x: 0, y: -1)
        )
    }
    
    static var yellowStar: Self {
        .init(
            icon: .symbol("star"),
            iconColor: .yellow
        )
    }
}

@available(iOS 16.0, macOS 13.0, *)
@available(*, deprecated, message: "This type has moved to https://github.com/danielsaidi/BadgeIcon")
private extension Color {
    
    func asGradientBackground() -> some View {
        Color.clear.overlay(self.gradient)
    }
}

@available(iOS 16.0, macOS 13.0, *)
@available(*, deprecated, message: "This type has moved to https://github.com/danielsaidi/BadgeIcon")
private extension View {
    
    @ViewBuilder
    func foregroundColor(
        _ color: Color?,
        gradientIf condition: Bool
    ) -> some View {
        if let color, condition {
            self.foregroundStyle(color.gradient)
        } else if let color {
            self.foregroundStyle(color)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func withStrokeColor(
        _ color: Color
    ) -> some View {
        self.cornerRadius(7)
            .padding(0.6)
            .background(color.cornerRadius(7.6))
    }
}
#endif
