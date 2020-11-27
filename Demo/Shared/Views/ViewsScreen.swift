//
//  ViewsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ViewsScreen: View {
    
    var body: some View {
        DemoList("Views") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit contains a large collection of additional views for SwiftUI.")
            }
            
            Section(header: Text("Views")) {
                list1
                list2
            }
        }
    }
    
    private var list1: some View {
        Group {
            DemoListLink("Async Image", .photo, AsyncImageScreen())
            DemoListLink("Circular Progress Bar", .circularProgressBar, CircularProgressBarScreen())
            #if os(iOS) || os(tvOS) || os(watchOS)
            DemoListLink("Circular Progress View", .circularProgressView, CircularProgressViewScreen())
            #endif
            #if os(iOS) || os(tvOS)
            DemoListLink("Collection View (grid)", .collectionViewGrid, CollectionViewGridScreen())
            DemoListLink("Collection View (shelves)", .collectionViewShelves, CollectionViewShelvesScreen())
            #endif
            DemoListLink("Conditional View", .conditional, ConditionalViewScreen())
            DemoListLink("Dismissable View", .dismiss, DismissableViewScreen())
            DemoListLink("Fetched Data View", .download, FetchedDataViewScreen())
            #if os(iOS)
            DemoListLink("Flippable View", .swipeGesture, FlippableViewScreen())
            DemoListLink("Multiline Text Field", .multiline, MultilineTextFieldScreen())
            #endif
        }
    }
    
    private var list2: some View {
        Group {
            DemoListLink("Optional View", .optional, OptionalViewScreen())
            #if os(iOS) || os(tvOS) || os(watchOS)
            DemoListLink("Page View", .pageControl, PageViewScreen())
            #endif
            #if os(iOS) || os(tvOS)
            DemoListLink("UIView Wrapper", .wrapper, UIViewWrapperScreen())
            #endif
        }
    }
}

struct ViewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewsScreen()
        }
    }
}
