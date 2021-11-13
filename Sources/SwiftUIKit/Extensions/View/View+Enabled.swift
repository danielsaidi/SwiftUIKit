//
//  View+Enabled.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Adds a condition that controls whether or not users can
     interact with this view.
     */
    func enabled(_ condition: Bool) -> some View {
        disabled(!condition)
    }
}
