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
    func enabled(_ condition: Bool) -> some View {
        disabled(!condition)
    }
}
