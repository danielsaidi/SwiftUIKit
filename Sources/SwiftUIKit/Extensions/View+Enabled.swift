//
//  View+Enabled.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Enable the view is a certain condition is met.
    ///
    /// This is just an inverted version of `disabled`. It's
    /// intended to increase readability.
    func enabled(_ condition: Bool) -> some View {
        disabled(!condition)
    }
}
