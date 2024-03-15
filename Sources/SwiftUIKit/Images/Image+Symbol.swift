//
//  Image+Symbol.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-29.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Image {

    /// This is a shorthand for `Image(systemName:)`.
    static func symbol(_ name: String) -> Image {
        .init(systemName: name)
    }
}
