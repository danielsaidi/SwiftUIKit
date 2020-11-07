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
 provided value if the value is not nil, else `EmptyView`.
 */
public struct OptionalView<Value, Content: View>: View {
    
    public init(_ value: Value?, @ViewBuilder content: @escaping ContentBuilder) {
        self.value = value
        self.content = content
    }
    
    private let value: Value?
    private let content: ContentBuilder
    
    public typealias ContentBuilder = (Value) -> Content
    
    public var body: some View {
        if let value = value {
            content(value)
        } else {
            EmptyView()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        let nilValue: Int? = nil
        return VStack {
            OptionalView(1) { Text("\($0)") }
            OptionalView(nilValue) { Text("\($0)") }
            OptionalView(3) { Text("\($0)") }
        }
    }
}
