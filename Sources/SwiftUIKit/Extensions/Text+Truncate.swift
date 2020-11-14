//
//  Text+Truncate.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-14.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Text {
    
    /**
     Disable truncation for horizontal one-line texts, where
     text can sometimes become truncated by mistace.
     */
    func disableTruncation() -> some View {
        self.fixedSize(horizontal: true, vertical: false)
    }
}
