//
//  ListItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use a custom modifier to add padding instead")
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
