//
//  FormActionButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This style can be applied to a ``FormActionButton`` to make
 it look like the horizontal action buttons that are used in
 e.g. the Contacts app.
 */
public struct FormActionButtonStyle: ButtonStyle {

    /**
     Create a custom form action button style.

     - Parameters:
       - iconHeight: The height if the button icon, by default `18`.
       - horizontalPadding: The intrinsic horizontal padding, by default `8`.
       - verticalPadding: The intrinsic vertical padding, by default `8`.
       - verticalSpacing: The vertical padding between the icon and title, by default `7`.
       - backgroundColor: The button background color, by default based on the color scheme.
       - foregroundColor: The button foreground color, by default `.primary`.
       - cornerRadius: The button corner radius, by default `10`.
       - dimmedOpacity: The opacity to apply to dimmed buttons, by default `0.4`.
       - disabledOpacity: The opacity to apply to disabled buttons, by default `0.4`.
       - pressedOpacity: The opacity to apply to pressed buttons, by default `0.7`.
       - shadowStyle: The shadow style to apply to the button, by default ``ViewShadowStyle/formActionButton``.
     */
    public init(
        iconHeight: Double = 18,
        horizontalPadding: Double = 8,
        verticalPadding: Double = 8,
        verticalSpacing: Double = 7,
        backgroundColor: Color? = nil,
        foregroundColor: Color = .accentColor,
        cornerRadius: Double = 10,
        dimmedOpacity: Double = 0.4,
        disabledOpacity: Double = 0.4,
        pressedOpacity: Double = 0.7,
        shadowStyle: ViewShadowStyle = .formActionButton
    ) {
        self.iconHeight = iconHeight
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.verticalSpacing = verticalSpacing
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.dimmedOpacity = dimmedOpacity
        self.disabledOpacity = disabledOpacity
        self.pressedOpacity = pressedOpacity
        self.shadowStyle = shadowStyle
    }


    /// The height if the button icon.
    public var iconHeight: Double

    /// The intrinsic horizontal padding.
    public var horizontalPadding: Double

    /// The intrinsic vertical padding.
    public var verticalPadding: Double

    /// The vertical padding between the icon and title.
    public var verticalSpacing: Double

    /// The button background color.
    public var backgroundColor: Color?

    /// The button foreground color.
    public var foregroundColor: Color?

    /// The button corner radius.
    public var cornerRadius: Double

    /// The opacity to apply to dimmed buttons.
    public var dimmedOpacity: Double

    /// The opacity to apply to disabled buttons.
    public var disabledOpacity: Double

    /// The opacity to apply to pressed buttons.
    public var pressedOpacity: Double

    /// The shadow style to apply to the button.
    public var shadowStyle: ViewShadowStyle


    @Environment(\.colorScheme)
    private var colorScheme: ColorScheme

    @Environment(\.isEnabled)
    private var isEnabled: Bool
        
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity)
            .background(backgroundView)
            .foregroundColor(foregroundColor)
            .opacity(isEnabled ? 1 : disabledOpacity)
            .opacity(configuration.isPressed ? pressedOpacity : 1)
    }
}

private extension FormActionButtonStyle {

    var backgroundView: some View {
        let color = backgroundColor ?? standardBackgroundColor
        return color
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(shadowStyle)

    }
}

public extension FormActionButtonStyle {

    /**
     The standard form action button style.

     You can change this standard style to affect the global
     appearance of the ``FormActionButtonStyle`` view.
     */
    static var standard = FormActionButtonStyle()

    /**
     A Swedish form action button style with blue background
     and yellow text.
     */
    static var swedish = FormActionButtonStyle(
        backgroundColor: .blue,
        foregroundColor: .yellow)

    /**
     The standard form action button style to apply when the
     app runs in a `.dark` color scheme.
     */
    static var standardDarkColorSchemeBackground: Color {
        .white.opacity(0.1)
    }

    /**
     The standard form action button style to apply when the
     app runs in a `.light` color scheme.
     */
    static var standardLightColorSchemeBackground: Color {
        .white
    }
}

public extension ViewShadowStyle {
    
    /**
     This shadow style is intended for `FormActionButton`s.
     */
    static var formActionButton: ViewShadowStyle {
        ViewShadowStyle(color: Color.black.opacity(0.05), radius: 10)
    }
}

private extension FormActionButtonStyle {
    
    var isDark: Bool { colorScheme == .dark }
    
    var standardBackgroundColor: Color {
        isDark ? Self.standardDarkColorSchemeBackground : Self.standardLightColorSchemeBackground
    }
}
