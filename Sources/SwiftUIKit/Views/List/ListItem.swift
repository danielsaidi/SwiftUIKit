//
//  ListItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be wrapped around items in a `List` to ensure
 that they get the same overall style and behavior.
 
 The view applies a minimum height to the content as well as
 vertical padding if the content becomes taller than the min
 height. It also applies an infinity max width and a content
 shape to ensure that the entire area is tappable.
 */
public struct ListItem<Content: View>: View {
    
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    private let content: () -> Content
    
    public var body: some View {
        HStack {
            content().padding(.vertical, 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ListItem {
                Text("Plain text")
            }
            ListItem {
                Label("Selected", systemImage: "checkmark")
            }
            ListItem {
                Label("Another, longer item", systemImage: "rectangle.and.pencil.and.ellipsis")
            }
        }
    }
}
