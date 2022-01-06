//
//  ListText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps the provided text in a `Text` and wraps the
 text view in a `ListItem`.
 */
public struct ListText: View {
    
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
            ListText("Text 1")
            ListText("Text 2")
            ListText("A long text 3")
        }
    }
}
