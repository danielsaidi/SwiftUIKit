//
//  ListSectionTitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view mimics the `Section` title in a grouped `List` to
 let us use that style outside of lists.
 
 The view doesn't add any insets by default, but you can set
 `withInsets` to `true` to apply a standard padding.
 */
public struct ListSectionTitle: View {

    public init(
        _ text: String,
        withInsets: Bool = false
    ) {
        self.text = text
        self.applyInsets = withInsets
    }

    private let text: String
    private let applyInsets: Bool
    
    public var body: some View {
        Text(text.uppercased())
            .foregroundColor(.secondary)
            .font(.footnote)
            .withGroupedListSectionHeaderInsets(if: applyInsets)
    }
}

private extension View {
    
    @ViewBuilder
    func withGroupedListSectionHeaderInsets(
        if condition: Bool
    ) -> some View {
        if condition {
            self.padding(.leading)
                .padding(.top, -3)
        } else {
            self
        }
    }
}

#Preview {

    List {
        Section(header: Text("Foo bar")) {
            ListSectionTitle("Foo bar")
        }
    }
}
