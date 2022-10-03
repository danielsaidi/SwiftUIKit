//
//  ListNavigationLink.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use ListButtonStyle instead")
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
