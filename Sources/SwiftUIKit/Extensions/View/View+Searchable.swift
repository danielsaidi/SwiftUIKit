//
//  View+Searchable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public extension View {

    /**
     Marks this view as searchable if the provided condition
     is `true`, which configures a search field for the view.

     `IMPORTANT` The extension uses an `if` clause to toggle
     between the searchable and non-searchable view. Do only
     use conditional views when you know the implications of
     doing so, such as how the view hierarchy is affected.

     - Parameters:
       - condition: Whether or not to make the view conditional.
       - text: The text to display and edit in the search field.
       - placement: The preferred placement of the search field.
       - prompt: The prompt of the search field, which provides users with guidance on what to search for.
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
}
