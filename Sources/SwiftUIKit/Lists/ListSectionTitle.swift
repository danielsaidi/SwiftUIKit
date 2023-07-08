//
//  ListSectionTitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view mimics the `Section` title in a grouped `List`.
 
 The view doesn't add any insets by default, but you can use
 the `withInsets` init parameter to make it apply a standard
 grouped title padding to the view.
 */
public struct ListSectionTitle: View {

    /**
     Create a list section title.
     */
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

struct ListSectionTitle_Previews: PreviewProvider {

    static var previews: some View {
        List {
            Section(header: Text("Foo bar")) {
                ListSectionTitle("Foo bar")
            }
        }
    }
}
