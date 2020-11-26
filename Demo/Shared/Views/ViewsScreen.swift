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
        DemoList("Views (* in progress)") {
            list1
            list2
        }
    }
    
    private var list1: some View {
        Group {
            DemoListLink("* Async Image", .photo, CornerRadiusStyleScreen())
            DemoListLink("* Collection View (shelves)", .collectionViewShelves, CornerRadiusStyleScreen())
            DemoListLink("* Collection View (grid)", .collectionViewGrid, CornerRadiusStyleScreen())
            DemoListLink("* Circular Progress Bar", .circularProgressBar, CornerRadiusStyleScreen())
            DemoListLink("* Circular Progress View", .circularProgressView, CornerRadiusStyleScreen())
            DemoListLink("* Conditional View", .conditional, CornerRadiusStyleScreen())
            DemoListLink("* Dismissable View", .dismiss, CornerRadiusStyleScreen())
            DemoListLink("* Detched Data View", .download, CornerRadiusStyleScreen())
            DemoListLink("Flippable View", .swipeGesture, FlippableViewScreen())
            DemoListLink("* Min Width Button", .width, CornerRadiusStyleScreen())
        }
    }
    
    private var list2: some View {
        Group {
            DemoListLink("* Multi Line Text Field", .multiline, CornerRadiusStyleScreen())
            DemoListLink("* MultiPageView", .pageControl, CornerRadiusStyleScreen())
            DemoListLink("* Optional View", .optional, CornerRadiusStyleScreen())
            DemoListLink("* UIView Wrapper", .wrapper, CornerRadiusStyleScreen())
            DemoListLink("* Width VStack", .widthList, CornerRadiusStyleScreen())
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
