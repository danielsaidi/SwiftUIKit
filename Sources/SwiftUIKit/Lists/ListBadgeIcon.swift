//
//  ListBadgeIcon.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-29.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view mimics the color badge icons that can be found in
 e.g. System Settings lists on iOS.

 You can use the `.listBadgeIcon(...)` view modifier to turn
 any `Image` into a list badge icon.
 
 Note that icon modification, like applying foreground color
 and symbol variant, works best with SF Symbols.
 */
@available(iOS 16.0, *)
public struct ListBadgeIcon: View {
    
    /**
     Create a system settings-like badge icon, with a custom
     badge color and a white, filled icon without a gradient.
     
     - Parameters:
       - image: The image to use.
       - color: The badge color to apply.
       - height: The icon height, by default `30`.
     */
    public init(
        image: Image,
        color: Color,
        height: CGFloat? = 30
    ) {
        self.image = image
        self.badgeColor = color
        self.iconColor = .white
        self.iconGradient = false
        self.height = height
    }
    
    /**
     Create a system settings-like badge icon, with a custom
     badge color and a custom colored, filled icon.
     
     - Parameters:
       - image: The image to use.
       - badgeColor: The badge color to apply.
       - iconColor: The icon color to apply.
       - iconGradient: Whether or not to apply a gradient to the icon color. by default `false`.
       - height: The icon height, by default `30`.
     */
    public init(
        image: Image,
        badgeColor: Color,
        iconColor: Color,
        iconGradient: Bool = false,
        height: CGFloat? = 30
    ) {
        self.image = image
        self.badgeColor = badgeColor
        self.iconColor = iconColor
        self.iconGradient = iconGradient
        self.height = height
    }

    private let image: Image
    private let badgeColor: Color
    private let iconColor: Color
    private let iconGradient: Bool
    private let height: CGFloat?

    public var body: some View {
        ZStack {
            badgeColor
                .asGradientBackground()
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(7)
            image.symbolVariant(.fill)
                .padding(5)
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(iconColor, gradientIf: iconGradient)
        }
        .backgroundStyle(badgeColor.gradient)
        .frame(minHeight: height, maxHeight: height)
    }
}

@available(iOS 16.0, *)
public extension ListBadgeIcon {
    
    static var settings: ListBadgeIcon {
        ListBadgeIcon(
            image: .symbol("gearshape"),
            badgeColor: .gray,
            iconColor: .white,
            iconGradient: true
        )
    }
    
    static var heart: ListBadgeIcon {
        ListBadgeIcon(
            image: .symbol("heart"),
            badgeColor: .hex(0xfafafa),
            iconColor: .red,
            iconGradient: true
        )
    }
    
    static var star: ListBadgeIcon {
        ListBadgeIcon(
            image: .symbol("star"),
            badgeColor: .hex(0xfafafa),
            iconColor: .yellow,
            iconGradient: true
        )
    }
}

@available(iOS 16.0, *)
private extension Color {
    
    @ViewBuilder
    func asGradientBackground(
        if condition: Bool = true
    ) -> some View {
        if condition {
            Color.clear.overlay(self.gradient)
        } else {
            self
        }
    }
}

@available(iOS 16.0, *)
private extension View {
    
    @ViewBuilder
    func foregroundColor(
        _ color: Color,
        gradientIf condition: Bool
    ) -> some View {
        if condition {
            self.foregroundStyle(color.gradient)
        } else {
            self.foregroundStyle(color)
        }
    }
}

@available(iOS 16.0, *)
struct ListBadgeIcon_Previews: PreviewProvider {

    static var previews: some View {
        List {
            ListBadgeIcon(
                image: .symbol("exclamationmark.triangle"),
                color: .orange
            )
            
            ListBadgeIcon.settings
            ListBadgeIcon.heart
            ListBadgeIcon.star
        }
    }
}
#endif
