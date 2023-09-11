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
        self._text = text
    }
    
    private let title: String
    private let placeholder: String
    
    @Binding
    private var text: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            FormTextTitle(title)
            TextField(placeholder, text: $text)
        }.padding(.vertical, 3)
    }
}

struct FormTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            FormTextField(
                title: "Title",
                placeholder: "Enter text",
                text: .constant("Text value"))
        }
    }
}
#endif
