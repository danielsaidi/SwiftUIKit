//
//  View+CornerRadius.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Applies a `CornerRadiusStyle` to the view.
     
     The result is identical to when using the standard view
     modifier directly.
     */
    func cornerRadius(_ style: CornerRadiusStyle) -> some View {
        cornerRadius(style.radius)
    }
}
