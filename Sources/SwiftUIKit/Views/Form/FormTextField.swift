//
//  FormTextField.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view can be used to present text fields in a list form.
 */
public struct FormTextField: View {

    /**
     Create a form multiline text editor.

     - Parameters:
       - title: The view title.
       - placeholder: The text field placeholder text.
       - text: The text to edit.
     */
    public init(
        title: String,
        placeholder: String,
        text: Binding<String>
    ) {
        self.title = title
        self.placeholder = placeholder
        self.isMultiline = false
        self.lineLimit = 1
        self.reservesSpace = false
        self._text = text
    }
    
    /**
     Create a form multiline text editor.

     - Parameters:
       - title: The view title.
       - placeholder: The text field placeholder text.
       - isMultiline: Whether or not the text field is multiline.
       - lineLimit: An optional line limit, by default `1`.
       - reservesSpace: Whether or not to reserve the line space, by default `false`.
       - text: The text to edit.
     */
    @available(iOS 16.0, *)
    public init(
        title: String,
        placeholder: String,
        isMultiline: Bool,
        lineLimit: Int = 1,
        reservesSpace: Bool = false,
        text: Binding<String>
    ) {
        self.title = title
        self.placeholder = placeholder
        self.isMultiline = isMultiline
        self.lineLimit = lineLimit
        self.reservesSpace = reservesSpace
        self._text = text
    }
    
    private let title: String
    private let placeholder: String
    private let isMultiline: Bool
    private let lineLimit: Int
    private let reservesSpace: Bool
    
    @Binding
    private var text: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            FormTextTitle(title)
            if #available(iOS 16.0, *), isMultiline {
                TextField(
                    placeholder,
                    text: $text,
                    axis: .vertical
                ).tryApplyLines(lineLimit, reserve: reservesSpace)
            } else {
                TextField(
                    placeholder,
                    text: $text
                )
            }
        }.padding(.vertical, 3)
    }
}

@available(iOS 16.0, *)
private extension View {
    
    @ViewBuilder
    func tryApplyLines(_ lines: Int, reserve: Bool) -> some View {
        if lines > 1 {
            self.lineLimit(lines, reservesSpace: reserve)
        } else {
            self
        }
    }
}

@available(iOS 16.0, *)
struct FormTextField_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State
        private var text = ""
        
        var body: some View {
            List {
                FormTextField(
                    title: "Title",
                    placeholder: "Enter text",
                    text: $text
                )
                FormTextField(
                    title: "Title",
                    placeholder: "Enter text",
                    isMultiline: true,
                    text: $text
                )
                FormTextField(
                    title: "Title",
                    placeholder: "Enter text",
                    isMultiline: true,
                    lineLimit: 5,
                    text: $text
                )
                FormTextField(
                    title: "Title",
                    placeholder: "Enter text",
                    isMultiline: true,
                    lineLimit: 5,
                    reservesSpace: true,
                    text: $text
                )
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
#endif
