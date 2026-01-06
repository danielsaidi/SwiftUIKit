//
//  Image+Symbol.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-29.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Image {

    /// Resolve an SF Symbols-based image, using `Image(systemName:)`.
    static func symbol(_ name: String) -> Image {
        .init(systemName: name)
    }
}
