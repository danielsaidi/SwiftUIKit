//
//  Text+SingleLine.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-14.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Text {
    
    /// Force text to render as multiline.
    func forceMultiline() -> some View {
        self.fixedSize(horizontal: false, vertical: true)
    }

    /// Force text to render as single line.
    func forceSingleLine() -> some View {
        self.fixedSize(horizontal: true, vertical: false)
    }
}
