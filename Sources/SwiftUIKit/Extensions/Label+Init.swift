//
//  Label+Init.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-10.
//  Copyright © 2021-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Label where Icon == Image, Title == Text {
    
    /// Create a label with a string and a plain image icon.
    init(
        _ text: LocalizedStringKey,
        _ image: Image,
        _ bundle: Bundle? = nil
    ) {
        self.init {
            Text(text, bundle: bundle)
        } icon: {
            image
        }
    }
}

#Preview {
    
    Label("Preview.Label", .symbol("checkmark"), .module)
}
