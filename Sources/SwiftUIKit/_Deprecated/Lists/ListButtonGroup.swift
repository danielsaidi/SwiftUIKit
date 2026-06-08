//
//  ListButtonGroup.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2024-03-15.
//  Copyright © 2024-2026 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
public struct ListButtonGroup<Content: View>: View {
    
    /// Create a form button group section.
    ///
    /// - Parameters:
    ///   - content: A custom content builder.
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    private let content: () -> Content
    
    @Environment(\.listButtonGroupStyle)
    private var style
    
    public var body: some View {
        Section {
            content()
        }
        .buttonStyle(style)
        .listRowInsets(.init(all: 0))
        .listRowBackground(Color.clear)
    }
}
#endif
