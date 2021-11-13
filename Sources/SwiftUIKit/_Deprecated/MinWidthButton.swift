//
//  MinWidthButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This button applies a min width to it's wrapped content. It
 simplifies working with buttons on platforms that applies a
 solid background below the button content, e.g. tvOS.
 */
@available(*, deprecated, message: "Use a Group with the frame set instead.")
public struct MinWidthButton<Content: View>: View {
    
    public init(
        minWidth: CGFloat,
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content) {
        self.minWidth = minWidth
        self.action = action
        self.content = content
    }
    
    private let minWidth: CGFloat
    private let action: () -> Void
    private let content: () -> Content
    
    public var body: some View {
        Button(action: action) {
            content().frame(minWidth: minWidth)
        }
    }
}
