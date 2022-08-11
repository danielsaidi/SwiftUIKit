//
//  OptionalView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view will render the provided content builder with the
 provided value if it's not nil, else a fallback view (which
 is `EmptyView` by default).
 
 For instance, if you want to show a text with the age of an
 optional `user`, you can use this view like this:
 
 ```swift
 OptionalView(user?.age) { age in
     Text("You are \(age) years old")
 }
 ```
 
 The same goes if `user` isn't optional, but `age` is:
 
 ```swift
 OptionalView(user?.age) { age in
     Text("You are \(age) years old")
 }
 ```
 
 You can specify a fallback view as a second, optional param
 using the more expressive initializer:
 
 ```swift
 OptionalView(
     if: user?.age,
     then: { Text("You are \($0) years old") },
     else: { Text("You seem to move beyond space and time") }
 )
 ```
 
 You can also create functions for your builders to get more
 readable code:
 
 ```swift
 func ageView(age: Int) -> some View {
     Text("You are \(age) years old")
 }
 
 func fallbackView() -> some View {
     Text("Hello, God!")
 }
 
 OptionalView(
     if: user?.age,
     then: ageView,
     else: fallbackView)
 ```
 */
@available(*, deprecated, message: "This view has been deprecated, since conditional views shouldn't be encouraged.")
public struct OptionalView<Value, Content: View, Fallback: View>: View {
    
    public init(
        if value: Value?,
        @ViewBuilder then content: @escaping ContentBuilder,
        @ViewBuilder else fallback: @escaping FallbackBuilder
    ) {
        self.value = value
        self.content = content
        self.fallback = fallback
    }
    
    private let value: Value?
    private let content: ContentBuilder
    private let fallback: FallbackBuilder
    
    public typealias ContentBuilder = (Value) -> Content
    public typealias FallbackBuilder = () -> Fallback
    
    public var body: some View {
        if let value = value {
            content(value)
        } else {
            fallback()
        }
    }
}

@available(*, deprecated, message: "This view has been deprecated, since conditional views shouldn't be encouraged.")
public extension OptionalView where Fallback == EmptyView {
    
    init(_ value: Value?, @ViewBuilder content: @escaping ContentBuilder) {
        self.init(
            if: value,
            then: content,
            else: { EmptyView() }
        )
    }
}
