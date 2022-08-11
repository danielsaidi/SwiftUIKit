//
//  PageView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
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
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public struct PageView<PageViewType: View>: View {
    
    /**
     Create a page view with a set of pre-built pages.
     
     This approach requires the pages to be the same kind of
     view. To render different kind of views, use the `items`
     and `pageBuilder` based initializer instead.
     
     - Parameters:
       - pages: The pages to present in the page view.
       - currentPageIndex: The currently presented page index.
       - pageIndicatorDisplayMode: The page index display mode to use, by default `.automatic`.
       - pageIndicatorStyle: The style to apply to the page indicator, by default `.standard`.
     */
    public init(
        pages: [PageViewType],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic,
        pageIndicatorStyle: PageIndicatorStyle = .standard
    ) {
        self.pages = pages
        self.pageIndicatorDisplayMode = pageIndicatorDisplayMode
        self.pageIndicatorStyle = pageIndicatorStyle
        self.currentPageIndex = currentPageIndex
    }

    /**
     Create a page view that takes a collection of items and
     applies a page builder to each item.
     
     - Parameters:
       - items: The items to present in the page view.
       - currentPageIndex: The currently presented page index.
       - pageIndicatorDisplayMode: The page index display mode to use, by default `.automatic`.
       - pageIndicatorStyle: The style to apply to the page indicator, by default `.standard`.
       - pageBuilder: A function that builds a page for each item in the items collection.
     */
    public init<Model>(
        items: [Model],
        currentPageIndex: Binding<Int>,
        pageIndicatorDisplayMode: PageIndicatorDisplayMode = .automatic,
        pageIndicatorStyle: PageIndicatorStyle = .standard,
        @ViewBuilder pageBuilder: (Model) -> PageViewType
    ) {
        self.pages = items.map(pageBuilder)
        self.pageIndicatorDisplayMode = pageIndicatorDisplayMode
        self.pageIndicatorStyle = pageIndicatorStyle
        self.currentPageIndex = currentPageIndex
        trySetupStyle()
    }
    
    private var currentPageIndex: Binding<Int>
    private let pageIndicatorDisplayMode: PageIndicatorDisplayMode
    private let pageIndicatorStyle: PageIndicatorStyle
    private let pages: [PageViewType]
    
    public var body: some View {
        TabView(selection: currentPageIndex) {
            ForEach(Array(pages.enumerated()), id: \.offset) {
                $0.element.tag($0.offset)
            }
        }.tabViewStyle(.page(indexDisplayMode: pageIndicatorDisplayMode.tabViewMode))
    }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
private extension PageView {
    
    func trySetupStyle() {
        #if os(iOS) || os(tvOS)
        if pageIndicatorStyle == .standard { return }
        let style = pageIndicatorStyle
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor(style.dotColor)
        appearance.currentPageIndicatorTintColor = UIColor(style.currentDotColor)
        #endif
    }
}
#endif
