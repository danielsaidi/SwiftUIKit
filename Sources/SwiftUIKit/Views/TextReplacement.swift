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
 
 `TODO`: This view should be able to wrap text over multiple
 lines. For now, the result is a single line.
 */
public struct TextReplacement: View {
    
    init(_ text: String, replace: String, with replacement: (String) -> Text) {
        let components = text.components(separatedBy: replace).map { Text($0) }
        let replacementView = replacement(replace)
        let joined = Array(components.flatMap { [$0, replacementView] }.dropLast())
        self.content = HStack(spacing: 0) {
            ForEach(Array(joined.enumerated()), id: \.offset) { $0.element }
        }.any()
    }
    
    private let content: AnyView
    
    public var body: some View {
        content.fixedSize(horizontal: true, vertical: false)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TextReplacement("This view is a view that create views", replace: "view") {
            Text($0).bold()
        }
    }
}
