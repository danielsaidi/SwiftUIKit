//
//  FormActionButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This style makes a button look like an `ActionButton`, with
 a solud, rounded background badge.
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
        shadowStyle: ShadowStyle = .none) {
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.disabledOpacity = disabledOpacity
        self.pressedOpacity = pressedOpacity
        self.shadowStyle = shadowStyle
    }
    
    public let backgroundColor: Color?
    public let cornerRadius: Double
    public let disabledOpacity: Double
    public let foregroundColor: Color?
    public let horizontalPadding: Double
    public let pressedOpacity: Double
    public let shadowStyle: ShadowStyle
    public let verticalPadding: Double
    
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
}

public extension ShadowStyle {
    
    /**
     This shadow style is intended for `FormActionButton`s.
     */
    static var formActionButton: ShadowStyle {
        ShadowStyle(color: Color.black.opacity(0.15), radius: 5)
    }
}

private extension FormActionButtonStyle {
    
    var isDark: Bool { colorScheme == .dark }
    
    var standardBackgroundColor: Color {
        isDark ? .white.opacity(0.1) : .white
    }
}
