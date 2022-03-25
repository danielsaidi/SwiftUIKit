//
//  PageContainer.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  Credits to @pawello2222
//  https://stackoverflow.com/questions/58388071/how-can-i-implement-pageview-in-swiftui/63159912
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

/**
 This view wraps the provided `pages` within a `TabView` and
 applies a `page` style to the tab view.
 
 This view is a declarative choice, since I personally think
 that a page view is conceptually different from a tab view.
 
 You can either create a page view with a fixed set of views
 or a collection of items and a page builder.
 */
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public struct PageView: View {
    
    /**
     Create a page view with a set of pre-built pages.
     */
    public init<PageType: View>(
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
    public init<Model, ViewType: View>(
        items: [Model],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        currentPageIndex: Binding<Int>,
        pageBuilder: (Model) -> ViewType) {
        self.pages = items.map { pageBuilder($0).any() }
        self.indexDisplayMode = indexDisplayMode
        self.currentPageIndex = currentPageIndex
    }
    
    private let pages: [AnyView]
    private let indexDisplayMode: PageTabViewStyle.IndexDisplayMode
    private var currentPageIndex: Binding<Int>
    
    public var body: some View {
        TabView(selection: currentPageIndex) {
            ForEach(Array(pages.enumerated()), id: \.offset) {
                $0.element.tag($0.offset)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: indexDisplayMode))
    }
}
#endif
