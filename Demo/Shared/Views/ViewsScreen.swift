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
            MenuListItem(icon: .photo, title: "Async Image").navigationLink(to: AsyncImageScreen())
            MenuListItem(icon: .circularProgressBar, title: "Circular Progress Bar").navigationLink(to: CircularProgressBarScreen())
            #if os(iOS) || os(tvOS) || os(watchOS)
            MenuListItem(icon: .circularProgressView, title: "Circular Progress View").navigationLink(to: CircularProgressViewScreen())
            #endif
            #if os(iOS) || os(tvOS)
            MenuListItem(icon: .collectionViewGrid, title: "Collection View (grid)").navigationLink(to: CollectionViewGridScreen())
            MenuListItem(icon: .collectionViewShelves, title: "Collection View (shelves)").navigationLink(to: CollectionViewShelvesScreen())
            #endif
            MenuListItem(icon: .conditional, title: "Conditional View").navigationLink(to: ConditionalViewScreen())
            MenuListItem(icon: .dismiss, title: "Dismissable View").navigationLink(to: DismissableViewScreen())
            MenuListItem(icon: .download, title: "Fetched Data View").navigationLink(to: FetchedDataViewScreen())
            #if os(iOS)
            MenuListItem(icon: .swipeGesture, title: "Flip View").navigationLink(to: FlipViewScreen())
            MenuListItem(icon: .multiline, title: "Multiline Text Field").navigationLink(to: MultilineTextFieldScreen())
            #endif
        }
    }
    
    private var list2: some View {
        Group {
            MenuListItem(icon: .optional, title: "Optional View").navigationLink(to: OptionalViewScreen())
            #if os(iOS) || os(tvOS) || os(watchOS)
            MenuListItem(icon: .pageControl, title: "Page View").navigationLink(to: PageViewScreen())
            #endif
            #if os(iOS) || os(tvOS)
            MenuListItem(icon: .wrapper, title: "UIView Wrapper").navigationLink(to: UIViewWrapperScreen())
            #endif
            #if os(iOS)
            MenuListItem(icon: .web, title: "Web View").navigationLink(to: WebViewScreen())
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
