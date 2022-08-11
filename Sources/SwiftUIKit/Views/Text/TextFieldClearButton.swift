//
//  TextFieldClearButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view mimics a text field clear button that is trailing
 in a text field.
 */
public struct TextFieldClearButton: ViewModifier {

    public init(text: Binding<String>) {
        self._text = text
    }

    @Binding
    var text: String

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

struct TextFieldClearButton_Previews: PreviewProvider {
    
    static var previews: some View {
        TextField("Enter text", text: .constant("Text"))
            .modifier(TextFieldClearButton(text: .constant("Text")))
    }
}
#endif
