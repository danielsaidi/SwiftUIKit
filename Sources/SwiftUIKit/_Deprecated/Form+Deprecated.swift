#if os(iOS)
import SwiftUI

@available(*, deprecated, renamed: "ListActionRow")
public typealias FormText = ListActionRow

@available(*, deprecated, message: "This type is no longer used.")
public struct FormRowTitle: View {

    public init(
        _ title: String
    ) {
        self.title = title
    }

    private let title: String

    public var body: some View {
        Text(title)
            .lineLimit(1)
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}

public extension View {
    
    @available(*, deprecated, message: "This type is no longer used.")
    func formRowTitle(
        _ title: String,
        spacing: Double = 5
    ) -> some View {
        VStack(alignment: .leading, spacing: spacing) {
            FormRowTitle(title)
            self
        }
    }
}
#endif
