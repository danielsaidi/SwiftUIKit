//
//  TagTextField.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This text field will automatically slugify any text that is
 entered into it.
 */
@available(*, deprecated, message: "This type has been moved to TagKit - https://github.com/danielsaidi/TagKit")
public struct TagTextField: View {

    /**
     Create a new tag text field.

     - Parameters:
       - text: The text binding.
       - placeholder: The text field placeholder, by default empty.
     */
    public init(
        text: Binding<String>,
        placeholder: String = ""
    ) {
        self.text = Binding<String>(
            get: { text.wrappedValue.slugified() },
            set: {
                if $0 == text.wrappedValue { return }
                text.wrappedValue = $0.slugified()
            }
        )
        self.placeholder = placeholder
    }
    
    private let text: Binding<String>
    private let placeholder: String
    
    public var body: some View {
        TextField(placeholder, text: text)
            .lowercased()
            .withoutCapitalization()
    }
}

private extension View {
    
    @ViewBuilder
    func withoutCapitalization() -> some View {
        #if os(iOS)
        self.autocapitalization(.none)
        #else
        self
        #endif
    }
    
    @ViewBuilder
    func lowercased() -> some View {
        if #available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *) {
            self.textCase(.lowercase)
        } else {
            self
        }
    }
}
