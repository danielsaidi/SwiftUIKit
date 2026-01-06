//
//  View+Enabled.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Enable the view is a certain condition is met.
    ///
    /// This is an inverted `disabled` that is intended to increase readability.
    func enabled(_ condition: Bool) -> some View {
        disabled(!condition)
    }
}
