//
//  ListNavigationButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view embeds a regular `Button` then appends a trailing ``NavigationLinkArrow`` to render as a `NavigationLink`.
 */
public struct NavigationButton<Content: View>: View {
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
    }
    
    private let action: () -> Void
    private let content: () -> Content
    
    public var body: some View {
        Button(action: action) {
            HStack {
                content()
                Spacer()
                NavigationLinkArrow()
            }
        }.buttonStyle(.list)
    }
}

#if os(iOS)
#Preview {
    
    struct Preview: View {
        
        @State
        var isToggled = false
        
        var body: some View {
            NavigationView {
                List {
                    Text("Is toggled: \(isToggled ? 1 : 0)")
                    NavigationLink("Navigation link") {
                        Text("HEJ")
                    }.offset()
                    NavigationButton(action: { isToggled.toggle() }, content: {
                        Text("Navigation Button")
                    })
                }
            }.foregroundColor(.red)
        }
    }
    
    return Preview()
}
#endif
