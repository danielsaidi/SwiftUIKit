//
//  Button+Init.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2024-04-30.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This will be removed in the next major update.")
public extension Button where Label == SwiftUI.Label<Text, Image> {
    
    /// This initializer lets you use buttons with less code.
    @_disfavoredOverload
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
