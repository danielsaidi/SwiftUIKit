import SwiftUI

public extension PageIndicator {
    
    @available(*, deprecated, message: "Custom styles must now be applied with .pageIndicatorStyle.")
    init(
        numberOfPages: Int,
        currentPageIndex: Binding<Int>,
        style: PageIndicatorStyle = .standard
    ) {
        self.init(
            numberOfPages: numberOfPages,
            currentPageIndex: currentPageIndex
        )
    }
}

#if os(macOS)
public extension PageView {
    
    @available(*, deprecated, message: "Custom page indicator styles must now be applied with .pageIndicatorStyle.")
    init(
        pages: [PageViewType],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic,
        pageIndicatorStyle: PageIndicatorStyle = .standard
    ) {
        self.init(
            pages: pages,
            currentPageIndex: currentPageIndex,
            pageIndicatorDisplayMode: pageIndicatorDisplayMode
        )
    }
    
    @available(*, deprecated, message: "Custom page indicator styles must now be applied with .pageIndicatorStyle.")
    init<Model>(
        items: [Model],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic,
        pageIndicatorStyle: PageIndicatorStyle = .standard,
        @ViewBuilder pageBuilder: (Model) -> PageViewType
    ) {
        self.init(
            items: items,
            currentPageIndex: currentPageIndex,
            pageIndicatorDisplayMode: pageIndicatorDisplayMode,
            pageBuilder: pageBuilder
        )
    }
}
#else
public extension PageView {
    
    @available(*, deprecated, message: "Custom page indicator styles must now be applied with .pageIndicatorStyle.")
    init(
        pages: [PageViewType],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic,
        pageIndicatorStyle: PageIndicatorStyle = .standard
    ) {
        self.init(
            pages: pages,
            currentPageIndex: currentPageIndex,
            pageIndicatorDisplayMode: pageIndicatorDisplayMode
        )
    }

    @available(*, deprecated, message: "Custom page indicator styles must now be applied with .pageIndicatorStyle.")
    init<Model>(
        items: [Model],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic,
        pageIndicatorStyle: PageIndicatorStyle = .standard,
        @ViewBuilder pageBuilder: (Model) -> PageViewType
    ) {
        self.init(
            items: items,
            currentPageIndex: currentPageIndex,
            pageIndicatorDisplayMode: pageIndicatorDisplayMode,
            pageBuilder: pageBuilder
        )
    }
}
#endif
