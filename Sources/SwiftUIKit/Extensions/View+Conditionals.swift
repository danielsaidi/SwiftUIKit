//
//  View+Conditionals.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-04.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Hide the view if the provided condition is `true`.
     
     This function uses an `if` clause to toggle state. Only
     use this when it won't affect your app performance.
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
     Make the view searchable if the condition is `true`.
     
     This function uses an `if` clause to toggle state. Only
     use this when it won't affect your app performance.
     */
    @ViewBuilder
    func searchable(
        if condition: Bool,
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: String
    ) -> some View {
        if condition {
            self.searchable(
                text: text,
                placement: placement,
                prompt: prompt)
        } else {
            self
        }
    }
    
    /**
     Show the view if the provided condition is `true`.

     This function uses an `if` clause to toggle state. Only
     use this when it won't affect your app performance.
     */
    func visible(if condition: Bool) -> some View {
        hidden(if: !condition)
    }
}
