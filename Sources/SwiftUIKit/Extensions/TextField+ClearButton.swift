//
//  TextField+ClearButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension TextField {
    
    func withClearButton(for text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(text: text))
    }
}
