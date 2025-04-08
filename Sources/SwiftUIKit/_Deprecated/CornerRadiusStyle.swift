//
//  CornerRadiusStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This is no longer used and will be removed in the next major release.")
public struct CornerRadiusStyle {
    
    public init(radius: CGFloat) {
        self.radius = radius
    }
    
    public let radius: CGFloat
}

@available(*, deprecated, message: "This is no longer used and will be removed in the next major release.")
public extension View {

    /// Apply a ``CornerRadiusStyle`` to the view.
    func cornerRadius(_ style: CornerRadiusStyle) -> some View {
        cornerRadius(style.radius)
    }
}
