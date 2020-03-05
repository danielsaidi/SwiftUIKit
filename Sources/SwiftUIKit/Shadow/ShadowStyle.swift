//
//  ShadowStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct can be used to contain all shadow config params
 for SwiftUI views within a single struct.
 
 This struct makes it easier to create various shadow styles,
 which is easily done with a static, calculated `ShadowStyle`
 extension property.
 */
public struct ShadowStyle {
    
    public init(
        color: Color = .black,
        radius: CGFloat,
        x: CGFloat,
        y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
    
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
}
