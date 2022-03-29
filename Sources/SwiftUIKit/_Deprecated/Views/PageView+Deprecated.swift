#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public extension PageView {
    
    /**
     Create a page view with a set of pre-built pages.
     */
    @available(*, deprecated, message: "currentPageIndex now comes before indexDisplayMode.")
    init<PageType: View>(
        pages: [PageType],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        currentPageIndex: Binding<Int>) {
        self.pages = pages.map { $0.any() }
        self.indexDisplayMode = indexDisplayMode
        self.currentPageIndex = currentPageIndex
    }

    /**
     Create a page view that takes a collection of items and
     applies a page builder to each item.
     */
    @available(*, deprecated, message: "currentPageIndex now comes before indexDisplayMode.")
    init<Model, ViewType: View>(
        items: [Model],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        currentPageIndex: Binding<Int>,
        pageBuilder: (Model) -> ViewType) {
        self.pages = items.map { pageBuilder($0).any() }
        self.indexDisplayMode = indexDisplayMode
        self.currentPageIndex = currentPageIndex
    }
}
#endif
