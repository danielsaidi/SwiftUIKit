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
     Apply a ``CornerRadiusStyle`` to the view.
     */
    func cornerRadius(_ style: CornerRadiusStyle) -> some View {
        cornerRadius(style.radius)
    }
}
