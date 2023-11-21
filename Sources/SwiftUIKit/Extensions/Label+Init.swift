//
//  Label+Init.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-10.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Label where Icon == Image, Title == Text {
    
    /// Create a label with a string and an image.
    init(_ text: String, image: Image) {
        self.init {
            Text(text)
        } icon: {
            image
        }
    }
}
