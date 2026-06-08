//
//  ListActionButtonGroup.swift
//  Vinylsamlaren
//
//  Created by Daniel Saidi on 2026-05-26.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct ListActionButtonGroup<Content: View>: View {

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }

    private let content: () -> Content

    public var body: some View {
        HStack(spacing: 10) {
            Group {
                content()
            }
            .tint(.accentColor)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
        }
        .listRowBackground(Color.clear)
        .listRowInsets(.init(top: 16, leading: 0, bottom: 16, trailing: 0))
    }
}
