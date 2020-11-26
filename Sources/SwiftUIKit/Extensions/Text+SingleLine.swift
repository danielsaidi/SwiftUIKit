//
//  Text+SingleLine.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-14.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Text {
    
    /**
     Forcing single line can help remove unwanted truncation
     for texts that have a line limit of 1 and are expected
     Disable truncation for horizontal one-line texts, where
     text can sometimes become truncated by mistace.
     */
    func forceSingleLine() -> some View {
        self.fixedSize(horizontal: true, vertical: false)
    }
}
