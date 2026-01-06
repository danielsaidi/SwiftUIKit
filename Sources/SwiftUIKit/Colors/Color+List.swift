//
//  Color+List.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-23.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Color {
    
    /// Get the standard list background color for a scheme.
    @ViewBuilder
    static func listBackground(
        forScheme scheme: ColorScheme
    ) -> some View {
        if scheme == .light {
            Color.primary.colorInvert()
        } else {
            Color.primary.opacity(0.102)
        }
    }
}
