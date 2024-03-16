//
//  PageView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-11.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
import SwiftUI

/**
 This view wraps its pages within a `.page` styled `TabView`.
 
 You can set it up with a fixed set of `pages` or with a set
 of `items` to which you apply a dynamic page builder.
 
 The view is a semantic alias for `TabView`, since I think a
 "page view" is conceptually different from a "tab view". It
 also has a macOS version, which means that you can use this
 view in the same way on all platforms.
 
 The view supports styling some parts of the native page dot
 views with a ``PageIndicatorStyle`` for iOS and tvOS, using
 UIKit appearance proxies. This however means that all views
 of this type are affected. For a more flexible and isolated
 approach, use `never` as `pageIndicatorDisplayMode` and add
 a ``PageIndicator`` view as an overlay.
 */
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
}

private extension PageView {
    
    func trySetupStyle() {
        #if os(iOS) || os(tvOS)
        let style = pageIndicatorStyle
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor(style.dotColor)
        appearance.currentPageIndicatorTintColor = UIColor(style.currentDotColor)
        #endif
    }
}
#endif
