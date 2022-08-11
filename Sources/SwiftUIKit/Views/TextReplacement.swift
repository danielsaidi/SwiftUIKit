//
//  TextReplacement.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-01-25.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view replaces a certain string with a replacement text
 view, then joins all views into a single `HStack`.
 */
public struct TextReplacement: View {
    
    public init(
        _ text: String,
        replace: String,
        with replacement: (String) -> Text
    ) {
        let components = text.components(separatedBy: replace)
        let joined = Array(components.flatMap { [Text($0), replacement(replace)] }.dropLast())
        self.content = joined.reduce(Text(""), { $0 + $1 })
    }
    
    private let content: Text
    
    public var body: some View {
        content
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TextReplacement("This view, is a view! that create views view that create views view that create views view that create views", replace: "view") {
            Text($0).font(.title).underline()
        }.font(.headline)
    }
}
