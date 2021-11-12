//
//  ViewsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ViewsScreen: View {
    
    var body: some View {
        List {
            Section {
                ListText("SwiftUIKit contains a large collection of additional views for SwiftUI.")
            }
            
            Section(header: Text("Views")) {
                list1
                list2
            }
        }.navigationBarTitle("Views")
    }
    
    private var list1: some View {
        Group {
            ListNavigationLink(destination: AsyncImageScreen()) {
                Label("Async Image", image: .photo)
            }
            ListNavigationLink(destination: CircularProgressBarScreen()) {
                Label("Circular Progress Bar", image: .circularProgressBar)
            }
            
            #if os(iOS) || os(tvOS) || os(watchOS)
            ListNavigationLink(destination: CircularProgressViewScreen()) {
                Label("Circular Progress View", image: .circularProgressView)
            }
            #endif
            
            #if os(iOS) || os(tvOS)
            ListNavigationLink(destination: CollectionViewGridScreen()) {
                Label("Collection View (grid)", image: .collectionViewGrid)
            }
            ListNavigationLink(destination: CollectionViewShelvesScreen()) {
                Label("Collection View (shelves)", image: .collectionViewShelves)
            }
            #endif
            
            ListNavigationLink(destination: ConditionalViewScreen()) {
                Label("Conditional View", image: .conditional)
            }
            ListNavigationLink(destination: DismissableViewScreen()) {
                Label("Dismissable View", image: .dismiss)
            }
            ListNavigationLink(destination: FetchedDataViewScreen()) {
                Label("Fetched Data View", image: .download)
            }
            
            #if os(iOS)
            ListNavigationLink(destination: FlipViewScreen()) {
                Label("Flip View", image: .swipeGesture)
            }
            ListNavigationLink(destination: MultilineTextFieldScreen()) {
                Label("Multiline Text Field", image: .multiline)
            }
            #endif
        }
    }
    
    private var list2: some View {
        Group {
            ListNavigationLink(destination: OptionalViewScreen()) {
                Label("Optional View", image: .optional)
            }
            
            #if os(iOS) || os(tvOS) || os(watchOS)
            ListNavigationLink(destination: PageViewScreen()) {
                Label("Page View", image: .pageControl)
            }
            #endif
            
            #if os(iOS) || os(tvOS)
            ListNavigationLink(destination: UIViewWrapperScreen()) {
                Label("UIView Wrapper", image: .wrapper)
            }
            #endif
    
            #if os(iOS)
            ListNavigationLink(destination: WebViewScreen()) {
                Label("Web View", image: .web)
            }
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
