#if os(iOS)
import SwiftUI

@available(*, deprecated, message: "Use .searchable instead")
public struct SearchBar: View {
    
    public init(
        title: String = "Search...",
        text: Binding<String>,
        cancelText: String = "Cancel",
        searchFieldBackgroundColor: Color = Color.primary.opacity(0.1),
        searchFieldCornerRadius: CGFloat = 10,
        searchFieldPadding: CGFloat = 5,
        searchFieldMargin: CGFloat = 8
    ) {
        self.title = title
        self.text = text
        self.cancelText = cancelText
        self.searchFieldBackgroundColor = searchFieldBackgroundColor
        self.searchFieldCornerRadius = searchFieldCornerRadius
        self.searchFieldPadding = searchFieldPadding
        self.searchFieldMargin = searchFieldMargin
    }
    
    private let title: String
    private let text: Binding<String>
    private let cancelText: String
    private let searchFieldBackgroundColor: Color
    private let searchFieldCornerRadius: CGFloat
    private let searchFieldPadding: CGFloat
    private let searchFieldMargin: CGFloat
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                searchField
                cancelButton
            }.padding(searchFieldMargin)
        }
    }
}

@available(*, deprecated, message: "Use .searchable instead")
private extension SearchBar {

    var hasText: Bool {
        !text.wrappedValue.isEmpty
    }

    @ViewBuilder
    var cancelButton: some View {
        if hasText {
            Button(action: cancel) {
                Text(cancelText)
            }
        } else {
            EmptyView()
        }
    }
    
    var searchField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(title, text: text)
                .withClearButton(for: text)
        }
        .padding(searchFieldPadding)
        .background(searchFieldBackground)
    }
    
    var searchFieldBackground: some View {
        RoundedRectangle(cornerRadius: searchFieldCornerRadius)
            .foregroundColor(searchFieldBackgroundColor)
    }
    
    func cancel() {
        withAnimation(.linear(duration: 0.1)) {
            text.wrappedValue = ""
            hideKeyboard()
        }
    }
}
#endif
