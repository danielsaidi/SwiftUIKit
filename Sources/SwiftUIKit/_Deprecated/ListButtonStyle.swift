//
//  ListButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-03.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use .tint(.primary) instead")
public struct ListButtonStyle: ButtonStyle {
    
    /// Create a custom style.
    ///
    /// - Parameters:
    ///   - pressedOpacity: The opacity to apply when the button is pressed, by default `0.5`.
    public init(
        pressedOpacity: Double = 0.5
    ) {
        self.pressedOpacity = pressedOpacity
    }
    
    /// The opacity to apply when the button is pressed.
    var pressedOpacity: Double

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .opacity(configuration.isPressed ? pressedOpacity : 1)
    }
}

@available(*, deprecated, message: "Use .tint(.primary) instead")
public extension ButtonStyle where Self == ListButtonStyle {

    /// The standard list card button style.
    static var list: ListButtonStyle { .init() }
    
    /// A custom list card button style.
    static func list(
        pressedOpacity: Double
    ) -> Self {
        .init(pressedOpacity: pressedOpacity)
    }
}
