//
//  View+Label.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-12-19.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Convert the view to a label.
    ///
    /// - Parameters:
    ///   - text: The label text.
    func label(_ text: String) -> some View {
        Label {
            Text(text)
        } icon: {
            self
        }
    }
}

#Preview {
    
    VStack {
        Color.red
            .label("Red")
        Image.symbol("checkmark")
            .label("Test")
    }
    .frame(width: 200, height: 100)
}
