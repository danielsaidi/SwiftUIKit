//
//  View+Visible.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Hides the view if the provided `condition` is `true`.
     */
    @ViewBuilder
    func hidden(if condition: Bool) -> some View {
        if condition {
            self.hidden()
        } else {
            self
        }
    }
    
    /**
     Shows the view if the provided `condition` is `true`.
     */
    func visible(if condition: Bool) -> some View {
        hidden(if: !condition)
    }
}
