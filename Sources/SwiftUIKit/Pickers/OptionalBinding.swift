//
//  OptionalBinding.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-15.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This type makes it possible to use optional bindings with a
 range of native SwiftUI controls.

 To pass in optional bindings to any non-optional parameters,
 just define a fallback value:

 ```swift
 @State
 var myValue: Double?

 func doSomething(with binding: Binding<Double>) { ... }

 doSomething(with: $myValue ?? 0)
 ```
 */
public func OptionalBinding<T>(_ binding: Binding<T?>, _ defaultValue: T) -> Binding<T> {
    Binding<T>(get: {
        binding.wrappedValue ?? defaultValue
    }, set: {
        binding.wrappedValue = $0
    })
}

public func ??<T> (left: Binding<T?>, right: T) -> Binding<T> {
    OptionalBinding(left, right)
}
