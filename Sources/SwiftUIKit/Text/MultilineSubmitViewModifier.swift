//
//  MultilineSubmitViewModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-09-15.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This modifier can be applied to a multi-line `TextField`,
/// to submit it when the the primary key is pressed.
public struct MultilineSubmitViewModifier: ViewModifier {
    
    /// Create a multiline submit view modifier.
    ///
    /// - Parameters:
    ///   - text: The text binding used by the text field.
    ///   - onSubmit: The function to call when return is pressed.
    public init(
        text: Binding<String>,
        action: @escaping () -> Void
    ) {
        self._text = text
        self.action = action
    }
    
    @Binding
    private var text: String
    
    private let action: () -> Void

    @FocusState
    private var isFocused: Bool
    
    public func body(content: Content) -> some View {
        content
            .focused($isFocused)
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
        action()
    }
}

public extension View {
    
    @available(*, deprecated, renamed: "onMultilineSubmit(of:action:)")
    func multilineSubmit(
        for text: Binding<String>,
        submitLabel: SubmitLabel = .done,
        action: @escaping () -> Void = {}
    ) -> some View {
        self.submitLabel(submitLabel)
            .onMultilineSubmit(of: text, action: action)
    }

    /// Make a multi-line textfield auto-submit whenever the
    /// primary button is pressed.
    ///
    /// - Parameters:
    ///   - text: The text binding used by the text field.
    ///   - action: The function to call when return is pressed.
    func onMultilineSubmit(
        of text: Binding<String>,
        action: @escaping () -> Void = {}
    ) -> some View {
        self.modifier(
            MultilineSubmitViewModifier(
                text: text,
                action: action
            )
        )
    }
}
