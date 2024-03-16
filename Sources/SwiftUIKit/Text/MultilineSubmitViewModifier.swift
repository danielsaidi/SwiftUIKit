//
//  MultilineSubmitViewModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-09-15.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view modifier can be applied to a multiline `TextField`
 to make it submit when the primary key is pressed.
 */
public struct MultilineSubmitViewModifier: ViewModifier {
    
    /// Create a multiline submit view modifier.
    ///
    /// - Parameters:
    ///   - text: The text binding used by the text field.
    ///   - submitLabel: The submit label to use.
    ///   - onSubmit: The function to call when return is pressed.
    public init(
        text: Binding<String>,
        submitLabel: SubmitLabel,
        onSubmit: @escaping () -> Void
    ) {
        self._text = text
        self.submitLabel = submitLabel
        self.onSubmit = onSubmit
    }
    
    @Binding
    private var text: String
    
    private let submitLabel: SubmitLabel
    private let onSubmit: () -> Void
    
    @FocusState
    private var isFocused: Bool
    
    public func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .submitLabel(submitLabel)
            #if os(visionOS)
            .onChange(of: text) { handle($1) }
            #else
            .onChange(of: text) { handle($0) }
            #endif
    }
    
    private func handle(_ newText: String) {
        guard isFocused else { return }
        guard newText.contains("\n") else { return }
        isFocused = false
        text = newText.replacingOccurrences(of: "\n", with: "")
        onSubmit()
    }
}

public extension View {
    
    /// Make a multiline textfield dismiss the keyboard when
    /// the primary button is pressed.
    ///
    /// - Parameters:
    ///   - text: The text binding used by the text field.
    ///   - submitLabel: The submit label to use, by default `.done`.
    ///   - action: The function to call when return is pressed.
    func multilineSubmit(
        for text: Binding<String>,
        submitLabel: SubmitLabel = .done,
        action: @escaping () -> Void = {}
    ) -> some View {
        self.modifier(
            MultilineSubmitViewModifier(
                text: text,
                submitLabel: submitLabel,
                onSubmit: action
            )
        )
    }
}
