//
//  ListCard.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can be used as floating cards in lists & grids.
///
/// The card can be styled with a corner radius and a shadow,
/// and can be provided with a list of context menu items.
public struct ListCard<Content: View, ContextMenuView: View>: View {

    /// Create a list card.
    ///
    /// - Parameters:
    ///   - content: The card content.
    public init(
        @ViewBuilder content: @escaping ContentBuilder
    ) where ContextMenuView == EmptyView {
        self.content = content
        self.contextMenu = { EmptyView() }
    }

    /// Create a list card with a context menu.
    ///
    /// - Parameters:
    ///   - content: The card content.
    ///   - contextMenu: The card context menu content.
    public init(
        @ViewBuilder content: @escaping ContentBuilder,
        @ViewBuilder contextMenu: @escaping ContextMenuBuilder
    ) {
        self.content = content
        self.contextMenu = contextMenu
    }

    public typealias ContentBuilder = () -> Content
    public typealias ContextMenuBuilder = () -> ContextMenuView

    @ViewBuilder
    private let content: ContentBuilder

    @ViewBuilder
    private let contextMenu: ContextMenuBuilder
    
    @Environment(\.listCardStyle)
    private var style

    public var body: some View {
        content()
            #if os(iOS)
            .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: style.cornerRadius))
            #endif
            .background(Color.primary.colorInvert())
            .cornerRadius(style.cornerRadius)
            #if os(iOS) || os(macOS) || os(tvOS)
            .contextMenu(menuItems: contextMenu)
            #endif
            .shadow(style.shadowStyle)
    }
}


public extension ViewShadowStyle {

    /// The standard list card shadow style.
    static var listCard: Self {
        .init(
            color: .black.opacity(0.2),
            radius: 2,
            x: 0,
            y: 2
        )
    }
}

#Preview {
    
    VStack {
        Group {
            Button {} label: {
                ListCard {
                    Color.red.frame(width: 200, height: 200)
                }
            }
            .buttonStyle(
                .listCard(
                    animation: .bouncy,
                    pressedScale: 0.2
                )
            )
            Button {} label: {
                ListCard {
                    Color.red.frame(width: 200, height: 200)
                } contextMenu: {
                    Button("Preview.Button") {}
                }
            }
        }
        .buttonStyle(.listCard)
        .padding(50)
        .background(Color.gray)
        .cornerRadius(20)
    }
}
