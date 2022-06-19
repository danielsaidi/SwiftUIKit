//
//  View+Shadow.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Apply a ``ViewShadowStyle`` to the view.
     */
    func shadow(_ style: ViewShadowStyle) -> some View {
        shadow(
            color: style.color,
            radius: style.radius,
            x: style.x,
            y: style.y)
    }
}
