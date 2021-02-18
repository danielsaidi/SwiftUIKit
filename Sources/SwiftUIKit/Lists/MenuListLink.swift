//
//  MenuListLink.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This button can be used in menu lists, either to trigger an
 action or an action that will cause a navigation, e.g. when
 the action will show a sheet or open an url.
 
 Note that for regular navigations, you should use a regular
 `MenuListItem` and wrap it in a `NavigationLink` or use the
 more convenient `MenuListLink` view.
 */
public struct MenuListLink<Destination: View>: View {
    
    public init(
        _ image: Image? = nil,
        _ text: String,
        _ rightImage: Image? = nil,
        destination: Destination) {
        self.item = MenuListItem(image, text, rightImage, isNavigation: rightImage == .menuListNavigationArrow)
        self.destination = destination
    }
    
    private let item: MenuListItem
    private let destination: Destination
    
    public var body: some View {
        NavigationLink(destination: destination) {
            item
        }
    }
}

struct MenuListLink_Previews: PreviewProvider {
    
    static var icon: Image { Image(systemName: "checkmark.circle.fill") }
    
    static var previews: some View {
        List {
            MenuListLink(icon, "Navigation button", icon, destination: Text("Hello"))
            MenuListLink(icon, "Navigation button", destination: Text("Hello"))
        }
    }
}
