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
 */
public struct ListSectionTitle: View {

    /**
     Create a list section title.
     */
    public init(_ text: String) {
        self.text = text
    }

    private let text: String
    
    public var body: some View {
        Text(text.uppercased())
            .foregroundColor(.secondary)
            .font(.footnote)
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
