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
        self.badgeStrokeColor = .clear
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
       - badgeStrokeColor: The badge stroke color to apply, by default `.clear`.
       - iconColor: The icon color to apply.
       - iconGradient: Whether or not to apply a gradient to the icon color. by default `false`.
       - height: The icon height, by default `30`.
     */
    public init(
        image: Image,
        badgeColor: Color,
        badgeStrokeColor: Color = .clear,
        iconColor: Color,
        iconGradient: Bool = false,
        height: CGFloat? = 30
    ) {
        self.image = image
        self.badgeColor = badgeColor
        self.badgeStrokeColor = badgeStrokeColor
        self.iconColor = iconColor
        self.iconGradient = iconGradient
        self.height = height
    }

    private let image: Image
    private let badgeColor: Color
    private let badgeStrokeColor: Color
    private let iconColor: Color
    private let iconGradient: Bool
    private let height: CGFloat?

    public var body: some View {
        ZStack {
            badgeColor
                .asGradientBackground()
                .withStrokeColor(badgeStrokeColor)
                .aspectRatio(1, contentMode: .fit)
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
    
    /// A gray settings icon.
    static var settings: ListBadgeIcon {
        ListBadgeIcon(
            image: .symbol("gearshape"),
            badgeColor: .gray,
            iconColor: .white,
            iconGradient: true
        )
    }
    
    /// A white, red heard badge icon.
    static var redHeart: ListBadgeIcon {
        .white(
            withIcon: .symbol("heart"),
            iconColor: .red
        )
    }
    
    /// A white, yellow star badge icon.
    static var yellowStar: ListBadgeIcon {
        .white(
            withIcon: .symbol("star"),
            iconColor: .yellow
        )
    }
    
    /// A white badge icon with a colored icon.
    static func white(
        withIcon icon: Image,
        iconColor: Color
    ) -> ListBadgeIcon {
        ListBadgeIcon(
            image: icon,
            badgeColor: .white,
            badgeStrokeColor: .hex(0xeeeeee),
            iconColor: iconColor,
            iconGradient: true
        )
    }
}

@available(iOS 16.0, *)
private extension Color {
    
    func asGradientBackground() -> some View {
        Color.clear.overlay(self.gradient)
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
    
    @ViewBuilder
    func withStrokeColor(
        _ color: Color
    ) -> some View {
        self.cornerRadius(7)
            .padding(0.6)
            .background(color.cornerRadius(7.6))
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
            ListBadgeIcon.redHeart
            ListBadgeIcon.yellowStar
        }
    }
}
#endif
