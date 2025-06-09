//
//  PageView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-11.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
public struct PageView<PageViewType: View>: View {
    
    /// Create a page view with a set of page views.
    ///
    /// This requires the pages to be the same view type. To
    /// use different views, use the `items` initializer.
    ///
    /// - Parameters:
    ///   - pages: The pages to present in the page view.
    ///   - currentPageIndex: The currently presented page index.
    ///   - pageIndicatorDisplayMode: The page index display mode to use, by default `.automatic`.
    public init(
        pages: [PageViewType],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic
    ) {
        self.pages = pages
        self.pageIndicatorDisplayMode = pageIndicatorDisplayMode
        self.currentPageIndex = currentPageIndex
    }

    /// Create a page view with a set of items.
    ///
    /// The initializer will apply the provided page builder
    /// to each item, to generate a dynamic view collection.
    ///
    /// - Parameters:
    ///   - items: The items to present in the page view.
    ///   - currentPageIndex: The currently presented page index.
    ///   - pageIndicatorDisplayMode: The page index display mode to use, by default `.automatic`.
    ///   - pageBuilder: A function that builds a page for each item in the items collection.
    public init<Model>(
        items: [Model],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic,
        @ViewBuilder pageBuilder: (Model) -> PageViewType
    ) {
        self.pages = items.map(pageBuilder)
        self.pageIndicatorDisplayMode = pageIndicatorDisplayMode
        self.currentPageIndex = currentPageIndex
    }
    
    private var currentPageIndex: Binding<Int>
    private let pageIndicatorDisplayMode: PageIndicatorDisplayMode
    private let pages: [PageViewType]
    
    @Environment(\.pageIndicatorStyle)
    private var pageIndicatorStyle
    
    public var body: some View {
        TabView(selection: currentPageIndex) {
            ForEach(Array(pages.enumerated()), id: \.offset) {
                $0.element.tag($0.offset)
            }
        }
        .onAppear(perform: trySetupStyle)
        .tabViewStyle(.page(indexDisplayMode: pageIndicatorDisplayMode.tabViewMode))
    }

    private func trySetupStyle() {
        #if os(iOS) || os(tvOS)
        let style = pageIndicatorStyle
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor(style.dotColor)
        appearance.currentPageIndicatorTintColor = UIColor(style.currentDotColor)
        #endif
    }
}
#endif
