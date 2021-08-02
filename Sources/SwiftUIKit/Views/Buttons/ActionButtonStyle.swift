//
//  ActionButtonStyle.swift
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
public struct ActionButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(.primary)
            .cornerRadius(10.0)
            .shadow(color: .black.opacity(0.2), radius: 5)
            .opacity(isEnabled ? 1 : 0.5)
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
}

private extension ActionButtonStyle {
    
    var isDark: Bool { colorScheme == .dark }
    
    var backgroundColor: Color {
        isDark ? .white.opacity(0.1) : .white
    }
}
