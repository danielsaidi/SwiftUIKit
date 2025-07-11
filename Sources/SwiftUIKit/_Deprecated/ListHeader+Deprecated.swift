import SwiftUI

public extension ListHeader {

    @available(*, deprecated, message: "Apply a custom bottom padding directly to the view instead.")
    @_disfavoredOverload
    init(
        bottomPadding: Double? = nil,
        @ViewBuilder view: @escaping () -> Content
    ) {
        self.init(content: view)
    }
}

@available(*, deprecated, message: "Use ListHeader directly instead")
public extension View {

    /// Convert the view to a list header.
    ///
    /// - Parameters:
    ///   - bottomPadding: A custom bottom padding, if any.
    func listHeader(
        bottomPadding: Double? = nil
    ) -> some View {
        ListHeader(bottomPadding: bottomPadding) {
            self
        }
    }
}

@available(*, deprecated, message: "Use ListHeader directly instead")
public extension Image {

    /// Convert the image to a list header.
    ///
    /// - Parameters:
    ///   - height: The image height, if any.
    ///   - bottomPadding: A custom bottom padding, if any.
    @MainActor func listHeader(
        height: CGFloat?,
        bottomPadding: Double? = nil
    ) -> some View {
        ListHeader {
            self.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: height)
        }
    }
}
