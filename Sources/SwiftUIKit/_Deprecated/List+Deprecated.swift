import SwiftUI

public extension ListActionRow {
    
    @available(*, deprecated, message: "Use the new action-based initializer.")
    init<TrailingView: View>(
        title: String,
        text: String,
        hideIfEmpty: Bool = false,
        trailingView: @escaping () -> TrailingView
    ) {
        self.init(title: title, text: text, action: nil, hideIfEmpty: hideIfEmpty)
    }
}
