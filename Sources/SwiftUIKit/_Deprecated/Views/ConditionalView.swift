//
//  ConditionalView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view takes a bool expression and will render a certain
 view when the expression is `true` else another view (which
 is `EmptyView` by default), for instance:
 
 ```swift
 ConditionalView(isLoading) {
     CircularProgressView()
 }
 ```
 
 You can specify a fallback view as a second, optional param
 using the more expressive initializer:
 
 ```swift
 ConditionalView(
     if: isLoading,
     then: { CircularProgressView() },
     else: { Text("You are not loading anything at all!") }
 )
 ```
 
 You can also create functions for your builders to get more
 readable code:
 
 ```swift
 func spinner() -> some View {
     CircularProgressView()
 }
 
 func fallbackView() -> some View {
     Text("You are not loading anything at all!")
 }
 
 ConditionalView(
     if: isLoading,
     then: spinner,
     else: fallback)
 ```
 */
@available(*, deprecated, message: "This view has been deprecated, since conditional views shouldn't be encouraged.")
public struct ConditionalView<Content: View, Fallback: View>: View {
    
    public init(
        if condition: Bool,
        @ViewBuilder then content: @escaping ContentBuilder,
        @ViewBuilder else fallback: @escaping FallbackBuilder) {
        self.condition = condition
        self.content = content
        self.fallback = fallback
    }
    
    private let condition: Bool
    private let content: ContentBuilder
    private let fallback: FallbackBuilder
    
    public typealias ContentBuilder = () -> Content
    public typealias FallbackBuilder = () -> Fallback
    
    public var body: some View {
        if condition {
            content()
        } else {
            fallback()
        }
    }
}

@available(*, deprecated, message: "This view has been deprecated, since conditional views shouldn't be encouraged.")
public extension ConditionalView where Fallback == EmptyView {
    
    init(_ condition: Bool, @ViewBuilder content: @escaping ContentBuilder) {
        self.init(if: condition, then: content, else: { EmptyView() })
    }
}

@available(*, deprecated, message: "This view has been deprecated, since conditional views shouldn't be encouraged.")
struct ConditionalView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            ConditionalView(true) { Text("1") }
            ConditionalView(false) { Text("2") }
            ConditionalView(true) { Text("3") }
            ConditionalView(
                if: true,
                then: { Text("True!") },
                else: { Text("False!") })
        }
    }
}
