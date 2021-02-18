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
        MenuList("Views") {
            Section {
                MenuListText("SwiftUIKit contains a large collection of additional views for SwiftUI.")
            }
            
            Section(header: Text("Views")) {
                list1
                list2
            }
        }
    }
    
    private var list1: some View {
        Group {
            MenuListLink("Async Image", .photo, destination: AsyncImageScreen())
            MenuListLink("Circular Progress Bar", .circularProgressBar, destination: CircularProgressBarScreen())
            #if os(iOS) || os(tvOS) || os(watchOS)
            MenuListLink("Circular Progress View", .circularProgressView, destination: CircularProgressViewScreen())
            #endif
            #if os(iOS) || os(tvOS)
            MenuListLink("Collection View (grid)", .collectionViewGrid, destination: CollectionViewGridScreen())
            MenuListLink("Collection View (shelves)", .collectionViewShelves, destination: CollectionViewShelvesScreen())
            #endif
            MenuListLink("Conditional View", .conditional, destination: ConditionalViewScreen())
            MenuListLink("Dismissable View", .dismiss, destination: DismissableViewScreen())
            MenuListLink("Fetched Data View", .download, destination: FetchedDataViewScreen())
            #if os(iOS)
            MenuListLink("Flippable View", .swipeGesture, destination: FlippableViewScreen())
            MenuListLink("Multiline Text Field", .multiline, destination: MultilineTextFieldScreen())
            #endif
        }
    }
    
    private var list2: some View {
        Group {
            MenuListLink("Optional View", .optional, destination: OptionalViewScreen())
            #if os(iOS) || os(tvOS) || os(watchOS)
            MenuListLink("Page View", .pageControl, destination: PageViewScreen())
            #endif
            #if os(iOS) || os(tvOS)
            MenuListLink("UIView Wrapper", .wrapper, destination: UIViewWrapperScreen())
            #endif
            #if os(iOS)
            MenuListLink("Web View", .web, destination: WebViewScreen())
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
