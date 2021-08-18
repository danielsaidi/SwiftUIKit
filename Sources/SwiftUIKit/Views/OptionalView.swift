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
 
 ```
 OptionalView(user?.age) { age in
     Text("You are \(age) years old")
 }
 ```
 
 The same goes if `user` isn't optional, but `age` is:
 
 ```
 OptionalView(user?.age) { age in
     Text("You are \(age) years old")
 }
 ```
 
 You can specify a fallback view as a second, optional param
 using the more expressive initializer:
 
 ```
 OptionalView(
     if: user?.age,
     then: { Text("You are \($0) years old") },
     else: { Text("You seem to move beyond space and time") }
 )
 ```
 
 You can also create functions for your builders to get more
 readable code:
 
 ```
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
public struct OptionalView<Value, Content: View, Fallback: View>: View {
    
    public init(
        if value: Value?,
        @ViewBuilder then content: @escaping ContentBuilder,
        @ViewBuilder else fallback: @escaping FallbackBuilder) {
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

public extension OptionalView where Fallback == EmptyView {
    
    init(_ value: Value?, @ViewBuilder content: @escaping ContentBuilder) {
        self.init(
            if: value,
            then: content,
            else: { EmptyView() }
        )
    }
}

struct OptionalView_Previews: PreviewProvider {
    
    static var previews: some View {
        let nilValue: Int? = nil
        return VStack {
            OptionalView(1) { Text("\($0)") }
            OptionalView(nilValue) { Text("\($0)") }
            OptionalView(3) { Text("\($0)") }
            OptionalView(
                if: nilValue,
                then: { Text("\($0)") },
                else: { Text("No age who dis") })
        }
    }
}
