//
//  ListSubtitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-02-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to display trailing subtitle texts in
 list items.
 */
public struct ListSubtitle: View {
    
    public init(_ text: String) {
        self.text = text
    }
    
    private let text: String
    
    public var body: some View {
        Text(text)
            .font(.footnote)
            .foregroundColor(.secondary)
            .lineLimit(1)
    }
}

struct ListSubtitle_Previews: PreviewProvider {
    
    static var previews: some View {
        ListSubtitle("Test")
    }
}
