//
//  MenuListItemStack.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 A menu list item stack is a horizontal stack with a certain
 spacing. You can use it to make a stack space out its items
 just like a menu list item.
 */
@available(*, deprecated, message: "Use the new ListItem views instead")
public struct MenuListItemStack<Content: View>: View {
    
    public init(
        @ViewBuilder content: @escaping ContentBuilder) {
        self.content = content
    }
    
    private let content: ContentBuilder
    
    public typealias ContentBuilder = () -> Content
    
    public var body: some View {
        HStack(spacing: 20) {
            content()
        }.background(Color.white.opacity(0.0001))
    }
}
