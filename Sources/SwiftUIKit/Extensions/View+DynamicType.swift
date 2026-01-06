//
//  View+DynamicType.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-09-30.
//  Copyright © 2021-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /// Disable dynamic type by applying a fixed size.
    ///
    /// - Parameters:
    ///   - sizeCategory: The size to apply, by default `.medium`.
    func disableDynamicType(
        sizeCategory: ContentSizeCategory = .medium
    ) -> some View {
        self.environment(\.sizeCategory, sizeCategory)
    }
}
