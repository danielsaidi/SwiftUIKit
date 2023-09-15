#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

@available(*, deprecated, message: "Use .forceMultiline() instead.")
public struct MultilineText: View {
    
    public init(_ text: String) {
        self.text = text
    }

    private let text: String
    
    public var body: some View {
        content.forceMultiline()
    }
    
    private var content: Text {
        if #available(iOS 15, tvOS 15, watchOS 8, *) {
            return Text(markdown: text)
        } else {
            return Text(text)
        }
    }
}
#endif
