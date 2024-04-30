import SwiftUI

#if os(iOS)
public extension ListActionRow {
    
    @available(*, deprecated, message: "Use the new action-based initializer instead.")
    init<TrailingView: View>(
        title: String,
        text: String,
        hideIfEmpty: Bool = false,
        trailingView: @escaping () -> TrailingView
    ) {
        self.init(title: .init(title), text: .init(text), action: nil)
    }
}
#endif

public extension ListCard {
    
    @available(*, deprecated, message: "Custom styles must now be applied with .listCardStyle.")
    init(
        style: ListCardStyle = .standard,
        @ViewBuilder content: @escaping ContentBuilder
    ) where ContextMenuView == EmptyView {
        self.init(content: content)
    }

    @available(*, deprecated, message: "Custom styles must now be applied with .listCardStyle.")
    init(
        style: ListCardStyle = .standard,
        @ViewBuilder content: @escaping ContentBuilder,
        @ViewBuilder contextMenu: @escaping ContextMenuBuilder
    ) {
        self.init(content: content, contextMenu: contextMenu)
    }
}

public extension ListShelfSection {
    
    @available(*, deprecated, message: "Custom styles must now be applied with .listShelfSectionStyle.")
    init(
        style: ListShelfSectionStyle = .standard,
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(title: title, content: content)
    }
}
