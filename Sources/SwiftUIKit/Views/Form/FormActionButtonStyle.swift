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
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    static var shadowStyle = ShadowStyle.none
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10.0)
            .shadow(Self.shadowStyle)
            .opacity(isEnabled ? 1 : 0.3)
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
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
    
    var backgroundColor: Color {
        isDark ? .white.opacity(0.1) : .white
    }
}
