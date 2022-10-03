//
//  ListButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use the new `ListButtonStyle` instead.")
public struct ListButton<Content: View>: View {
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
    }
    
    private let action: () -> Void
    private let content: () -> Content
    
    public var body: some View {
        Button(action: action) {
            ListItem(content: content)
        }
    }
}
