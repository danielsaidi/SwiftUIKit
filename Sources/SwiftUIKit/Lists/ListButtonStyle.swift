//
//  ListButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-03.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This style makes buttons take up the entire row and applies
 a content shape that makes the entire view tappable.

 You can apply the style with `.buttonStyle(.list)`, and can
 apply it to an entire list, just as with other styles.
 */
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

#if os(iOS) || os(macOS)
#Preview {

    struct Preview: View {

        @State
        private var overlayText = ""

        var body: some View {
            List {
                ForEach(0...100, id: \.self) {
                    button("Button \($0)")
                        .buttonStyle($0 == 0 ? .list : .list(pressedOpacity: 0.1))
                }
            }
            .overlay(overlay)
            .buttonStyle(.list)
        }

        var overlay: some View {
            Text(overlayText)
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
                .opacity(overlayText.isEmpty ? 0 : 1)
                .onTapGesture { overlayText = "" }
        }

        func button(_ name: String) -> some View {
            Button(name) {
                overlayText = "\(name) tapped!"
            }
        }
    }

    return Preview()
}
#endif
