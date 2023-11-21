//
//  MultilineSubmitViewModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-09-15.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view modifier can be applied to a multiline `TextField`
 to make it submit when the primary (return) key is pressed.
 */
public struct MultilineSubmitViewModifier: ViewModifier {
    
    /**
     Create a multiline submit view modifier.
     
     - Parameters:
       - text: The text binding used by the text field.
       - submitLabel: The submit label to use.
       - onSubmit: The function to call when return is pressed.
     */
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
            .onChange(of: text) { newValue in
                guard isFocused else { return }
                guard newValue.contains("\n") else { return }
                isFocused = false
                text = newValue.replacingOccurrences(of: "\n", with: "")
                onSubmit()
            }
    }
}

public extension View {
    
    /**
     Apply this to a multiline text field to make it dismiss
     the keyboard when return is pressed.
     
     - Parameters:
       - text: The text binding used by the text field.
       - submitLabel: The submit label to use, by default `.done`.
     */
    func multilineSubmit(
        for text: Binding<String>,
        submitLabel: SubmitLabel = .done
    ) -> some View {
        self.modifier(
            MultilineSubmitViewModifier(
                text: text,
                submitLabel: submitLabel,
                onSubmit: {}
            )
        )
    }
    
    /**
     Apply this to a multiline text field to make it dismiss
     the keyboard when return is pressed.
     
     - Parameters:
       - text: The text binding used by the text field.
       - submitLabel: The submit label to use, by default `.done`.
       - onSubmit: The function to call when return is pressed.
     */
    func onMultilineSubmit(
        in text: Binding<String>,
        submitLabel: SubmitLabel = .done,
        action: @escaping () -> Void
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
