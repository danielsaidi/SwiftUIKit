//
//  Text+Markdown.swift
//  Text+Markdown
//
//  Created by Daniel Saidi on 2021-09-05.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

@available(iOS 15, tvOS 15, watchOS 8, *)
public extension Text {
    
    /**
     Create a text view with markdown.
     */
    init(markdown: String) {
        let options = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        let str = try? AttributedString(markdown: markdown, options: options)
        self.init(str ?? "Invalid markdown")
    }
}

@available(iOS 15, tvOS 15, watchOS 8, *)
struct Text_Markdown_Previews: PreviewProvider {
    
    static var previews: some View {
        Text(markdown: "Hello, **world**!\n\nThis is *markdown*!")
            .multilineTextAlignment(.center)
    }
}
#endif
