//
//  CornerRadiusStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This styles defines a corner radius, to allow strong typing.
 
 You can specify your own standard styles by creating static,
 calculated extension properties, for instance:
 
 ```swift
 extension CornerRadiusStyle {
 
     static let card = Self(radius: 5)
 }
 ```
 
 You can apply this style using the `.cornerRadius(_ style:)`
 view modifier.
 */
public struct CornerRadiusStyle {
    
    public init(radius: CGFloat) {
        self.radius = radius
    }
    
    public let radius: CGFloat
}

public extension View {

    /// Apply a ``CornerRadiusStyle`` to the view.
    func cornerRadius(_ style: CornerRadiusStyle) -> some View {
        cornerRadius(style.radius)
    }
}
