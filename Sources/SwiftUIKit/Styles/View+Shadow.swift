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
     Applies a `ShadowStyle` to the view.
     
     The result is identical to when using the standard view
     modifier directly.
     */
    func shadow(_ style: ShadowStyle) -> some View {
        shadow(
            color: style.color,
            radius: style.radius,
            x: style.x,
            y: style.y)
    }
}
