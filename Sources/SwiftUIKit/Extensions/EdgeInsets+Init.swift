//
//  UIEdgeInsets+Insets.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-09-30.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension EdgeInsets {
    
    /// Create a value with the same insets everywhere.
    init(all: Double) {
        self.init(
            top: all,
            leading: all,
            bottom: all,
            trailing: all
        )
    }
    
    /// Create a value with horizontal and vertical values.
    init(horizontal: Double, vertical: Double) {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }
}
