//
//  FormActionButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This style makes a SwiftUI `Button` look like an iOS action
 button, with a solid, rounded background badge.
 
 Note that there is a bug in iOS 14 that may cause the color
 scheme to have an invalid value. If this happens, you could
 define a custom style and provide an explicit color.
 */
public struct FormActionButtonStyle: ButtonStyle {
    
    public init(
        horizontalPadding: Double = 8,
        verticalPadding: Double = 8,
        backgroundColor: Color? = nil,
        foregroundColor: Color = .primary,
        cornerRadius: Double = 10,
        disabledOpacity: Double = 0.3,
        pressedOpacity: Double = 0.7,
        shadowStyle: ViewShadowStyle = .none
    ) {
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.disabledOpacity = disabledOpacity
        self.pressedOpacity = pressedOpacity
        self.shadowStyle = shadowStyle
    }
    
    public var backgroundColor: Color?
    public var cornerRadius: Double
    public var disabledOpacity: Double
    public var foregroundColor: Color?
    public var horizontalPadding: Double
    public var pressedOpacity: Double
    public var shadowStyle: ViewShadowStyle
    public var verticalPadding: Double
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.isEnabled) private var isEnabled: Bool
        
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity)
            .background(backgroundColor ?? standardBackgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .shadow(shadowStyle)
            .opacity(isEnabled ? 1 : disabledOpacity)
            .opacity(configuration.isPressed ? pressedOpacity : 1)
    }
}

public extension FormActionButtonStyle {
    
    static let standard = FormActionButtonStyle()
    
    static var standardDarkColorSchemeBakground: Color {
        .white.opacity(0.1)
    }
    
    static var standardLightColorSchemeBakground: Color {
        .white
    }
}

public extension ViewShadowStyle {
    
    /**
     This shadow style is intended for `FormActionButton`s.
     */
    static var formActionButton: ViewShadowStyle {
        ViewShadowStyle(color: Color.black.opacity(0.15), radius: 5)
    }
}

private extension FormActionButtonStyle {
    
    var isDark: Bool { colorScheme == .dark }
    
    var standardBackgroundColor: Color {
        isDark ? Self.standardDarkColorSchemeBakground : Self.standardLightColorSchemeBakground
    }
}
