//
//  Button+Init.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2024-04-30.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Button where Label == SwiftUI.Label<Text, Image> {
    
    /// This initializer lets you use buttons with less code.
    init(
        _ text: LocalizedStringKey,
        _ icon: Image,
        _ bundle: Bundle = .main,
        action: @escaping () -> Void
    ) {
        self.init(action: action) {
            Label(
                title: { Text(text, bundle: bundle) },
                icon: { icon }
            )
        }
    }
}

#Preview {
    
    Button("Preview.Button", .symbol("checkmark"), .module) {
        print("Tapped!")
    }
}
