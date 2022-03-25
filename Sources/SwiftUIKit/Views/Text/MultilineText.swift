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
 multiline texts. This view also accepts markdown content.
 */
public struct MultilineText: View {
    
    public init(_ text: String) {
        self.text = text
    }

    private let text: String
    
    public var body: some View {
        content.forceMultiline()
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
