//
//  View+Frame.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-01-05.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Apply a size-based frame.
    func frame(_ size: CGSize) -> some View {
        self.frame(width: size.width, height: size.height)
    }
    
    /// Apply the same size to all sides of the view.
    func frame(square size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
