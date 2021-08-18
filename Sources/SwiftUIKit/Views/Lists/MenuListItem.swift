//
//  MenuListItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension MenuListItem where Title == Text {
    
    /**
     This convenience initializer creates a list that uses a
     `Text` view for the `title` string.
     */
    init(
        icon: Image? = nil,
        title: String,
        trailingIcon: Image? = nil) {
        self.init(
            icon: icon,
            title: Text(title),
            trailingIcon: trailingIcon)
    }
}

/**
 A list item can have a left icon, a centered title view and
 an optional trailing icon.
 */
public struct MenuListItem<Title: View>: View {
    
    public init(
        icon: Image? = nil,
        title: Title,
        trailingIcon: Image? = nil) {
        self.init(
            icon: icon,
            title: title,
            trailingIcon: trailingIcon,
            isNavigationButton: false)
    }
    
    public init(
        icon: Image? = nil,
        trailingIcon: Image? = nil,
        @ViewBuilder title: @escaping TitleBuilder) {
        self.init(
            icon: icon,
            title: title(),
            trailingIcon: trailingIcon,
            isNavigationButton: false)
    }

    /**
     This internal init is used to define whether or not the
     item is a navigation item. This is only used by buttons
     that navigate.
     */
    init(
        icon: Image?,
        title: Title,
        trailingIcon: Image?,
        isNavigationButton: Bool = false) {
        self.icon = icon
        self.title = title
        self.trailingIcon = trailingIcon
        self.isNavigationButton = isNavigationButton
    }
    
    private let title: Title
    private let icon: Image?
    private let trailingIcon: Image?
    private let isNavigationButton: Bool
    
    public typealias TitleBuilder = () -> Title
    
    public var body: some View {
        HStack {
            if let icon = icon {
                MenuListItemIcon(icon)
            }
            title
            Spacer()
            OptionalView(trailingIcon) { $0 }
            trailingView(for: trailingIcon)
        }.background(Color.white.opacity(0.0001))
    }
}

public extension MenuListItem {
    
    /**
     Convert this item to a `Button` that performs an action.
     */
    func button(action: @escaping () -> Void) -> some View {
        Button(action: action) { self }
            .buttonStyle(PlainButtonStyle())
    }

    /**
     Convert this item to a `Button` that performs an action
     that is a navigation action, e.g. present a sheet.
     
     This replaces any defined `trailingIcon` with a chevron.
     */
    func navigationButton(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            MenuListItem(icon: icon, title: title, trailingIcon: trailingIcon, isNavigationButton: true)
        }.buttonStyle(PlainButtonStyle())
    }
    
    /**
     Convert this item to a `NavigationLink`, that navigates
     to a certain destination view.
     
     This replaces any defined `trailingIcon` with `nil`.
     */
    func navigationLink<Destination: View>(to destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            MenuListItem(icon: icon, title: title, trailingIcon: trailingIcon)
        }
    }
}

private extension MenuListItem {
    
    @ViewBuilder
    func trailingView(for image: Image?) -> some View {
        if isNavigationButton {
            NavigationLinkArrow()
        } else {
            EmptyView()
        }
    }
}

struct MenuListItem_Previews: PreviewProvider {
    
    static var icon: Image { Image(systemName: "checkmark.circle.fill") }
    
    static func item(_ text: String) -> MenuListItem<Text> {
        MenuListItem(icon: icon, title: text, trailingIcon: icon)
    }
    
    static var previews: some View {
        NavigationView {
            List {
                item("Item")
                item("Button").button(action: {})
                item("Navigation Button").navigationButton(action: {})
                item("Navigation Link").navigationLink(to: Text("HEJ"))
                
                MenuListItem(title: "Text only")
                
                MenuListItem(icon: icon, title: VStack(alignment: .leading) {
                    Text("Hello").font(.title)
                    Text("World")
                }, trailingIcon: icon)
            }
        }
    }
}
