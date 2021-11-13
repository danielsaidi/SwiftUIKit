//
//  TextField+ClearButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

public extension TextField {
    
    /**
     Append a trailing clear button to the text field, which
     can be used to clear the text field content.
     
     This applies a ``TextFieldClearButton`` modifier to the
     view.
     */
    func withClearButton(for text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(text: text))
    }
}
#endif
