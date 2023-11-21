//
//  TextEditorStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-23.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This enum defined various text editor styles.
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

    private var cornerRadius: Double { 5.0 }

    private func stroke(
        _ color: Color,
        lineWidth: CGFloat = 0.5
    ) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(color, lineWidth: lineWidth)
    }
}

struct TextEditorStyle_Previews: PreviewProvider {

    @State
    static var text: String = "Hello, world"

    static var previews: some View {
        VStack {
            TextField("", text: $text)
                .textFieldStyle(.roundedBorder)
            TextEditor(text: $text)
                .textEditorStyle(.roundedBorder)
            TextEditor(text: $text)
                .textEditorStyle(.roundedColorBorder(.red, 1))
        }
        .padding(10)
        .background(Color.primary.colorInvert())
        // .environment(\.colorScheme, .dark)
    }
}
#endif
