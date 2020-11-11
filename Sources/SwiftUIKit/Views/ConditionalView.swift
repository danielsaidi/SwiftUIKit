//
//  ConditionalView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view will render the provided content builder when the
 provided condition is `true`, else `EmptyView`.
 
 For instance, if you only want to show a logout view when a
 user is logged in, you can use this view like this:
 
 ```
 ConditionalView(isLoggedIn) { age in
     Button("Logout", action: logout)
 }
 ```
 */
public struct ConditionalView<Content: View>: View {
    
    public init(_ condition: Bool, @ViewBuilder content: @escaping ContentBuilder) {
        self.condition = condition
        self.content = content
    }
    
    private let condition: Bool
    private let content: ContentBuilder
    
    public typealias ContentBuilder = () -> Content
    
    public var body: some View {
        if condition {
            content()
        } else {
            EmptyView()
        }
    }
}

struct ConditionalView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            ConditionalView(1 == 1) { Text("1 == 1") }
            ConditionalView(1 == 2) { Text("1 == 2") }
            ConditionalView(2 == 2) { Text("2 == 2") }
        }
    }
}
