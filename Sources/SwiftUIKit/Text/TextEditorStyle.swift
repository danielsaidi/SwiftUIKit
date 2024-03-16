//
//  TextEditorStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-23.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This enum defines various `TextEditor` styles.
 */
public enum TextEditorStyle {

    /// The standard, borderless style.
    case automatic

    /// The standard, borderless style.
    case plain

    /// A rounded border style.
    case roundedBorder

    /// A rounded border style with a custom color.
    case roundedColorBorder(Color, Double = 0.5)
}

public extension TextEditor {

    /// Apply a ``TextEditorStyle`` to a text editor.
    ///
    /// Due to how the modifier works, it must be applied to
    /// the `TextEditor` directly.
    @ViewBuilder
    func textEditorStyle(_ style: TextEditorStyle) -> some View {
        switch style {
        case .automatic, .plain:
            self
        case .roundedBorder:
            self.cornerRadius(cornerRadius)
                .overlay(stroke(Color.primary.opacity(0.17)))
        case .roundedColorBorder(let color, let width):
            self.cornerRadius(cornerRadius)
                .overlay(stroke(color, lineWidth: width))
        }
    }
}

private extension TextEditor {
    
    var cornerRadius: Double { 5.0 }

    func stroke(
        _ color: Color,
        lineWidth: CGFloat = 0.5
    ) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(color, lineWidth: lineWidth)
    }
}

#Preview {
    
    struct Preview: View {
        
        @State
        var text: String = "Hello, world"
        
        var body: some View {
            VStack {
                TextField("", text: $text)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $text)
                    .textEditorStyle(.roundedBorder)
                TextEditor(text: $text)
                    .textEditorStyle(.roundedColorBorder(.red, 5))
            }
            .padding(10)
            .background(Color.primary.colorInvert())
            // .environment(\.colorScheme, .dark)
        }
    }
    
    return Preview()
}
#endif
