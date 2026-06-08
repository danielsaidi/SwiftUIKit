//
//  ListShelfSection.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
public struct ListShelfSection<Title: View, Content: View>: View {

    /// Create a list shelf section.
    ///
    /// - Parameters:
    ///   - title: The section title view.
    ///   - content: The section content.
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }
    
    private let shadowSpacing = 50.0
    private let title: () -> Title
    private let content: () -> Content
    
    @Environment(\.listShelfSectionStyle) private var style

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            title()
                .padding(.horizontal, style.horizontalPadding)
                .padding(.bottom, style.rowTitleSpacing)
                
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: style.rowItemSpacing) {
                    content()
                }
                .padding(.vertical, shadowSpacing)
                .padding(.horizontal, style.horizontalPadding)
            }
            .padding(.vertical, -shadowSpacing)
            .padding(.bottom, style.rowSpacing)
        }
    }
}
