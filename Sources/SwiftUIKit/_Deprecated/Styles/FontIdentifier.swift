import SwiftUI

@available(*, deprecated, message: "This is no longer used")
public protocol FontIdentifier {
    
    var fontName: String { get }
}

#if os(iOS) || os(tvOS) || os(watchOS)
public extension View {
    
    @available(*, deprecated, message: "Use font(name:style:weight:) directly instead.")
    func font(
        identifier: FontIdentifier,
        style: UIFont.TextStyle,
        weight: Font.Weight = .regular
    ) -> some View {
        font(
            name: identifier.fontName,
            style: style,
            weight: weight
        )
    }
}
#endif
