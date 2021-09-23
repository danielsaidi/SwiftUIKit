//
//  MultilineText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-09-09.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

/**
 This view can be used to force text to display properly for
 multiline texts, for when the text is cut off with ellipsis.
 
 The only thing this view does, is to force a fixed vertical
 size onto the text view.
 */
public struct MultilineText: View {
    
    public init(_ text: String) {
        self.text = text
    }

    private let text: String
    
    public var body: some View {
        content.fixedSize(horizontal: false, vertical: true)
    }
}

private extension MultilineText {
    
    var content: Text {
        if #available(iOS 15, tvOS 15, watchOS 8, *) {
            return Text(markdown: text)
        } else {
            return Text(text)
        }
    }
}

struct MultilineText_Previews: PreviewProvider {
    
    static var previews: some View {
        MultilineText("Hello, world")
    }
}
#endif
