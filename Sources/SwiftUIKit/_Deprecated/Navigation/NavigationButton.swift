//
//  ListNavigationButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
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
