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
     Force multiline rendering of a `Text` view where a text
     can become truncated although there is space.
     */
    func forceMultiline() -> some View {
        self.fixedSize(horizontal: false, vertical: true)
    }
    
    /**
     Force single-line rendering of a `Text` view, where the
     text can become truncated when it should not.
     */
    func forceSingleLine() -> some View {
        self.fixedSize(horizontal: true, vertical: false)
    }
}
