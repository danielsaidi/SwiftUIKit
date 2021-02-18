//
//  MenuListButton.swift
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
 
 This view will apply a `PlainButtonStyle` to the button, to
 make it fit in with other list items. If you don't want the
 plain style, wrap a `MenuListItem` in a regular button.
 */
public struct MenuListButton: View {
    
    public init(
        _ image: Image? = nil,
        _ text: String,
        _ rightImage: Image? = nil,
        action: @escaping () -> Void) {
        self.item = MenuListItem(image, text, rightImage, isNavigation: rightImage == .menuListNavigationArrow)
        self.action = action
    }
    
    public init(
        _ image: Image? = nil,
        _ text: String,
        navigationAction: @escaping () -> Void) {
        self.item = MenuListItem(image, text, .menuListNavigationArrow, isNavigation: true)
        self.action = navigationAction
    }
    
    private let item: MenuListItem
    private let action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            item
        }.buttonStyle(PlainButtonStyle())
    }
}

struct MenuListButton_Previews: PreviewProvider {
    
    static var icon: Image { Image(systemName: "checkmark.circle.fill") }
    
    static var previews: some View {
        List {
            MenuListButton(icon, "This is a list button", icon, action: {})
            MenuListButton(icon, "This is a navigation button", navigationAction: {})
        }
    }
}
