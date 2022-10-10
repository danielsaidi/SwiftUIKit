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
     Hides the view if the provided condition is `true`.

     This function uses an `if` clause to toggle between the
     hidden and non-hidden result types. Do only use it when
     you know the implications of using conditional views.
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

     This is just an inverted `hidden` modifier, intended to
     increase readability.

     This function uses an `if` clause to toggle between the
     hidden and non-hidden result types. Do only use it when
     you know the implications of using conditional views.
     */
    func visible(if condition: Bool) -> some View {
        hidden(if: !condition)
    }
}
