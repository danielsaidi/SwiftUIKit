//
//  View+DynamicType.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-09-30.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /**
     Disable dynamic type by applying a medium size category.
     */
    func disableDynamicType() -> some View {
        self.environment(\.sizeCategory, .medium)
    }
}
