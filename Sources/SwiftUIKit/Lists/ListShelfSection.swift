//
//  ListShelfSection.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to add a horizontally scrolling shelf
 to a vertically scrolling list.
 */
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

    @ViewBuilder
    private let title: () -> Title

    @ViewBuilder
    private let content: () -> Content
    
    @Environment(\.listShelfSectionStyle)
    private var style

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

#Preview {
    
    struct PreviewSection: View {
        
        var body: some View {
            ListShelfSection {
                ListSectionTitle("Section")
            } content: {
                Group {
                    Button {} label: {
                        ListCard {
                            Color.red
                        } contextMenu: {
                            Button("1") {}
                            Button("2") {}
                            Button("3") {}
                        }
                    }
                    
                    ListCard {
                        Color.green
                    } contextMenu: {
                        Button("1") {}
                        Button("2") {}
                        Button("3") {}
                    }
                    
                    ListCard {
                        Color.blue
                    } contextMenu: {
                        Button("1") {}
                        Button("2") {}
                        Button("3") {}
                    }
                }
                .buttonStyle(.listCard)
                .frame(width: 150, height: 150)
            }
        }
    }
        
    return ScrollView(.vertical) {
        VStack {
            PreviewSection()
            PreviewSection()
            PreviewSection()
        }
    }
}
