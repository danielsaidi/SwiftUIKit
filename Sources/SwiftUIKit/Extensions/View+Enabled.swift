//
//  View+Enabled.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Adds a condition that controls whether or not users can
     interact with this view.

     This is just an inverted version of the `disabled` view
     modifier, intended to increase readability.
     */
    func enabled(_ condition: Bool) -> some View {
        disabled(!condition)
    }
}
