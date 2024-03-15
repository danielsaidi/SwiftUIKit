//
//  PageView_macOS.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-30.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI
import Combine

/**
 This view mimics a `.page` styled iOS `TabView`.
 
 You can set up the view with a set of `pages` or `items` to
 which you apply a dynamic page builder.
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
        self.currentPageIndex = currentPageIndex
        self.pages = pages
        self.pageIndicatorDisplayMode = pageIndicatorDisplayMode
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
        self.currentPageIndex = currentPageIndex
        self.pages = items.map(pageBuilder)
        self.pageIndicatorDisplayMode = pageIndicatorDisplayMode
    }
    
    private var currentPageIndex: Binding<Int>
    private let pageIndicatorDisplayMode: PageIndicatorDisplayMode
    private let pages: [PageViewType]
    
    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                ScrollViewReader { scroll in
                    ScrollView(.horizontal) {
                        pageStack(for: geo)
                    }
                    .onReceive(Just(currentPageIndex), perform: {
                        setPageIndex(to: $0.wrappedValue, with: scroll)
                    })
                    .overlay(swipeLayer(for: scroll))
                    .overlay(bugfixLayer(for: scroll))
                }
                pageIndicator
            }
        }
    }
}

private extension PageView {
    
    @ViewBuilder
    var pageIndicator: some View {
        if shouldShowPageIndicator {
            PageIndicator(
                numberOfPages: pages.count,
                currentPageIndex: currentPageIndex
            )
            .padding()
        } else {
            EmptyView()
        }
    }
    
    func bugfixLayer(for scroll: ScrollViewProxy) -> some View {
        Text("\(currentPageIndex.wrappedValue)")
            .opacity(0)
    }
    
    func pageStack(for geo: GeometryProxy) -> some View {
        HStack {
            ForEach(Array(pages.enumerated()), id: \.offset) {
                $0.element
                    .id($0.offset)
                    .tag($0.offset)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
    
    func swipeLayer(for scroll: ScrollViewProxy) -> some View {
        Color.white.opacity(0.00001)
            .onSwipeGesture(
                left: { showNextPage(with: scroll) },
                right: { showPreviousPage(with: scroll) })
    }
}

private extension PageView {
    
    var shouldShowPageIndicator: Bool {
        switch pageIndicatorDisplayMode {
        case .always: return true
        case .automatic: return pages.count > 1
        case .never: return false
        }
    }
    
    func setPageIndex(to index: Int, with scroll: ScrollViewProxy) {
        withAnimation {
            currentPageIndex.wrappedValue = index
            scroll.scrollTo(index)
        }
    }
    
    func showNextPage(with scroll: ScrollViewProxy) {
        guard currentPageIndex.wrappedValue < pages.count - 1 else { return }
        setPageIndex(to: currentPageIndex.wrappedValue + 1, with: scroll)
    }
    
    func showPreviousPage(with scroll: ScrollViewProxy) {
        guard currentPageIndex.wrappedValue > 0 else { return }
        setPageIndex(to: currentPageIndex.wrappedValue - 1, with: scroll)
    }
}
#endif
