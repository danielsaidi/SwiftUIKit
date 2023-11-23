//
//  TextFieldClearButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-18.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view modifier adds a clear button to any `TextField`.

 You can apply it with `.modifier(TextFieldClearButton(...))`
 or the custom `.withClearButton(for: $text)`.
 */
public struct TextFieldClearButton: ViewModifier {

    public init(text: Binding<String>) {
        self._text = text
    }

    @Binding
    private var text: String

    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" }
        }
    }
}

public extension TextField {

    /**
     Append a trailing ``TextFieldClearButton`` to this text
     field, that can be used to clear the text field content.
     */
    func withClearButton(for text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(text: text))
    }
}

#Preview {

    struct Preview: View {

        @State
        private var text = ""

        var body: some View {
            TextField("Test", text: $text)
                .withClearButton(for: $text)
        }
    }

    return Preview()
}
#endif
