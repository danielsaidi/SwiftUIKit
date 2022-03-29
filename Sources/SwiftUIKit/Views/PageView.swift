//
//  PageContainer.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

/**
 This view wraps the provided `pages` within a `TabView` and
 applies a `page` style to the tab view.
 
 You can either create a page view with a fixed set of views
 or a collection of items and a page builder.
 
 I have added this to the library as a semantic alias, since
 I think that a "page view" is conceptually different from a
 "tab view", and don't like how SwiftUI has implemented this.
 */
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public struct PageView: View {
    
    /**
     Create a page view with a set of pre-built pages.
     
     - Parameters:
       - pages: The pages to present in the page view.
       - currentPageIndex: The currently presented page index.
       - indexDisplayMode: The page index display mode to use, by default `.automatic`.
     */
    public init<PageType: View>(
        pages: [PageType],
        currentPageIndex: Binding<Int>,
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic) {
        self.pages = pages.map { $0.any() }
        self.indexDisplayMode = indexDisplayMode
        self.currentPageIndex = currentPageIndex
    }

    /**
     Create a page view that takes a collection of items and
     applies a page builder to each item.
     
     - Parameters:
       - items: The items to present in the page view.
       - currentPageIndex: The currently presented page index.
       - indexDisplayMode: The page index display mode to use, by default `.automatic`.
       - pageBuilder: A function that builds a page for each item in the items collection.
     */
    public init<Model, ViewType: View>(
        items: [Model],
        currentPageIndex: Binding<Int>,
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
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
        }.tabViewStyle(.page(indexDisplayMode: indexDisplayMode))
    }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
struct PageView_Previews: PreviewProvider {
    
    struct StaticPreview: View {
        
        @State private var index = 0
        
        var body: some View {
            PageView(
                pages: [
                    Color.red,
                    Color.green,
                    Color.blue
                ],
                currentPageIndex: $index)
        }
    }
    
    struct DynamicPreview: View {
        
        enum PageType: CaseIterable {
            case red, green, blue
            
            var color: Color {
                switch self {
                case .red: return .red
                case .green: return .green
                case .blue: return .blue
                }
            }
        }
        
        @State private var index = 0
        
        var body: some View {
            PageView(
                items: PageType.allCases,
                currentPageIndex: $index) { page in
                    page.color
                }
        }
    }
    
    static var previews: some View {
        VStack {
            StaticPreview()
            DynamicPreview()
        }
    }
}
#endif
