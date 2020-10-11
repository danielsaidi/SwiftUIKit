//
//  MultiPageView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  Credits to @pawello2222
//  https://stackoverflow.com/questions/58388071/how-can-i-implement-pageview-in-swiftui/63159912
//

import SwiftUI

@available(iOS 14.0, *)
public struct MultiPageView: View {
    
    public init<PageType: View>(
        pages: [PageType],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        currentPageIndex: Binding<Int>) {
        self.pages = pages.map { $0.any() }
        self.indexDisplayMode = indexDisplayMode
        self.currentPageIndex = currentPageIndex
    }
    
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
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: indexDisplayMode))
    }
}
