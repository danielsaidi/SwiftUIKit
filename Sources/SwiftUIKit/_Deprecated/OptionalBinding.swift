//
//  OptionalBinding.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-15.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
@MainActor
public func OptionalBinding<T>(
    _ binding: Binding<T?>,
    _ defaultValue: T
) -> Binding<T> {
    Binding<T>(get: {
        binding.wrappedValue ?? defaultValue
    }, set: {
        binding.wrappedValue = $0
    })
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
@MainActor
public func ??<T> (left: Binding<T?>, right: T) -> Binding<T> {
    OptionalBinding(left, right)
}
