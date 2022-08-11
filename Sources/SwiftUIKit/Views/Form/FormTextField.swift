//
//  FormTextField.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view can be used to present text fields in a list form.
 */
@available(iOS 14, *)
public struct FormTextField: View {
    
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
            Text(title)
                .font(.footnote)
                .textCase(.lowercase)
                .foregroundColor(.secondary)
            TextField(placeholder, text: $text)
        }.padding(.vertical, 3)
    }
}

@available(iOS 14, *)
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
