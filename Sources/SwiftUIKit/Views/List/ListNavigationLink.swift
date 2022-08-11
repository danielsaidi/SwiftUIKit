//
//  ListNavigationLink.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps the provided content in a ``ListItem`` then
 wraps the item within a `NavigationLink`.
 */
public struct ListNavigationLink<Content: View, Destination: View>: View {
    
    public init(
        destination: Destination,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.destination = { destination }
        self.content = content
    }
    
    public init(
        @ViewBuilder destination: @escaping () -> Destination,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.destination = destination
        self.content = content
    }

    private let destination: () -> Destination
    private let content: () -> Content
    
    public var body: some View {
        NavigationLink(destination: destination) {
            ListItem(content: content)
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ListNavigationLinkItem_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            List {
                ListNavigationLink(destination: Text("Page 1")) {
                    Text("Page 1")
                }
                ListNavigationLink(destination: Text("Page 2")) {
                    Label("Page 2", systemImage: "checkmark")
                }
                ListNavigationLink(destination: Text("Page 3")) {
                    Label("A long link to page 3", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
                ListNavigationLink(destination: Text("Page 4")) {
                    ListText("Text with icon and subtitle",
                             icon: Image(systemName: "lightbulb"),
                             subtitle: "Subtitle")
                }
                
            }
        }
    }
}
