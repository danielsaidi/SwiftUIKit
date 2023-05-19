//
//  ListShelfSection.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to add a horizontally scrolling shelf
 to avertically scrolling list.
 */
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 8.0, *)
public struct ListShelfSection<Title: View, Content: View>: View {

    /**
     Create a list shelf section.

     - Parameters:
       - title: The section title view.
       - content: The section content.
     */
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }

    @ViewBuilder
    private let title: () -> Title

    @ViewBuilder
    private let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            title()
                .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    content()
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 16)
            }
            .padding(.vertical, -40)
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct ListShelfSection_Previews: PreviewProvider {

    static var section: some View {
        ListShelfSection {
            Text("Section").font(.headline)
        } content: {
            Group {
                ListCard {
                    Color.red
                } contextMenu: {
                    Button("1") {}
                    Button("2") {}
                    Button("3") {}
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
            .frame(width: 150, height: 150)
        }
    }

    static var previews: some View {
        ScrollView(.vertical) {
            VStack {
                section
                section
                section
            }
        }
    }
}
