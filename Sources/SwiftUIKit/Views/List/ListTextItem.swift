//
//  ListTextItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps the provided string in a ``Text`` view then
 wraps that text in a ``ListItem``.
 */
public struct ListTextItem: View {
    
    public init(_ text: String) {
        self.text = text
    }
    
    private let text: String
    
    public var body: some View {
        ListItem {
            Text(text)
        }
    }
}

struct ListTextItem_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ListTextItem("Text 1")
            ListTextItem("Text 2")
            ListTextItem("A long text 3")
        }
    }
}
