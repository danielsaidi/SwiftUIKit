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
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode,
        currentPageIndex: Binding<Int>) {
        self.init(
            pages: pages,
            currentPageIndex: currentPageIndex,
            indexDisplayMode: indexDisplayMode)
    }

    /**
     Create a page view that takes a collection of items and
     applies a page builder to each item.
     */
    @available(*, deprecated, message: "currentPageIndex now comes before indexDisplayMode.")
    init<Model, ViewType: View>(
        items: [Model],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode,
        currentPageIndex: Binding<Int>,
        pageBuilder: @escaping (Model) -> ViewType) {
        self.init(
            items: items,
            currentPageIndex: currentPageIndex,
            indexDisplayMode: indexDisplayMode,
            pageBuilder: pageBuilder)
    }
}
#endif
