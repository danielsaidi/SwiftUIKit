//
//  PlainListContent.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-01.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
private struct PlainListContent<Content: View>: View {

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }

    private let content: (() -> Content)

    public var body: some View {
        VStack {
            content()
        }
        .frame(maxWidth: .infinity)
        .listRowBackground(Color.clear)
        .prefersListRowSeparatorHidden()
    }
}

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
public struct ListFooter<Content: View>: View {

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        #if os(iOS)
        self.padding = -10
        #else
        self.padding = 0
        #endif
        self.content = content
    }

    private let padding: Double
    private let content: (() -> Content)

    public var body: some View {
        PlainListContent(content: content)
            .padding(.top, padding)
    }
}

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
public struct ListHeader<Content: View>: View {

    /// Create a list header.
    ///
    /// - Parameters:
    ///   - content: The header view.
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        #if os(iOS)
        self.padding = -10
        #else
        self.padding = 0
        #endif
        self.content = content
    }
    
    private let padding: Double
    private let content: (() -> Content)

    public var body: some View {
        PlainListContent(content: content)
            .padding(.bottom, padding)
    }
}

private extension View {

    @ViewBuilder
    func prefersListRowSeparatorHidden() -> some View {
        #if os(tvOS) || os(watchOS)
        self
        #else
        if #available(iOS 15.0, macOS 13.0, watchOS 9.0, *) {
            self.listRowSeparator(.hidden)
        } else {
            self
        }
        #endif
    }
}
