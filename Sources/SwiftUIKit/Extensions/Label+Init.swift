//
//  Label+Init.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-10.
//  Copyright © 2021-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Label where Title == Text {
    
    /// Create a label with a title and a custom view icon.
    init(
        _ text: LocalizedStringResource,
        _ icon: @escaping () -> Icon,
    ) {
        self.init {
            Text(text)
        } icon: {
            icon()
        }
    }
}

public extension Label where Icon == Image, Title == Text {
    
    /// Create a label with a title and a plain image icon.
    init(
        _ text: LocalizedStringResource,
        _ image: Image,
    ) {
        self.init {
            Text(text)
        } icon: {
            image
        }
    }
}

#Preview {
    
    Label("Title", .symbol("checkmark"))
    Label("Title") {
        Color.red.frame(width: 20, height: 20)
    }
}
