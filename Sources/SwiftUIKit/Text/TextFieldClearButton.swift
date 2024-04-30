//
//  TextFieldClearButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-18.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view modifier adds a clear button to any `TextField`.

 You can apply it with `.modifier(TextFieldClearButton(...))`
 or the custom `.withClearButton(for: $text)`.
 */
public struct TextFieldClearButton: ViewModifier {

    public init(
        text: Binding<String>,
        animation: Animation? = nil
    ) {
        self._text = text
        self.animation = animation ?? .smooth
    }

    @Binding
    private var text: String
    
    private var animation: Animation

    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .animation(animation, value: text)
                .onTapGesture { self.text = "" }
        }
    }
}

public extension TextField {

    /// Add a trailing ``TextFieldClearButton`` to this text
    /// field, that can be used to clear the text binding.
    func withClearButton(
        for text: Binding<String>,
        _ animation: Animation? = nil
    ) -> some View {
        self.modifier(
            TextFieldClearButton(
                text: text,
                animation: animation
            )
        )
    }
}

#Preview {

    struct Preview: View {

        @State
        private var text = ""
        
        var placeholder: String {
            .init(localized: "Preview.Placeholder", bundle: .module)
        }

        var body: some View {
            VStack {
                TextField(placeholder, text: $text)
                    .withClearButton(for: $text)
                TextField(placeholder, text: $text)
                    .withClearButton(
                        for: $text,
                        .bouncy(duration: 1, extraBounce: 0.1)
                    )
            }
            .textFieldStyle(.roundedBorder)
        }
    }

    return Preview()
}
#endif
