//
//  OptionalBinding.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-15.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This lets you use optional bindings with native SwiftUI.
///
/// To pass in optional bindings to a non-optional parameter,
/// just define a fallback value:
///
/// ```swift
/// @State
/// var myValue: Double?
///
/// func doSomething(with binding: Binding<Double>) { ... }
///
/// doSomething(with: $myValue ?? 0)
/// ```
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

@MainActor
public func ??<T> (left: Binding<T?>, right: T) -> Binding<T> {
    OptionalBinding(left, right)
}
