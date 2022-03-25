//
//  MenuListItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 A list item can have a left icon, a centered title view and
 an optional trailing icon.
 */
@available(*, deprecated, message: "Use the new ListItem views instead")
public struct MenuListItem<Content: View>: View {
    
    /**
     This can be used to create a list item with any content.
     */
    public init(
        @ViewBuilder content: @escaping ContentBuilder) {
        self.isNavigationButton = false
        self.content = content
    }

    /**
     This internal init is used to define whether or not the
     item is a navigation button item.
     */
    init(
        isNavigationButton: Bool,
        @ViewBuilder content: @escaping ContentBuilder) {
        self.isNavigationButton = isNavigationButton
        self.content = content
    }
    
    private let content: ContentBuilder
    private let isNavigationButton: Bool
    
    public typealias ContentBuilder = () -> Content
    
    public var body: some View {
        MenuListItemStack {
            content()
            trailingView
        }
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
public extension MenuListItem where Content == AnyView {
    
    /**
     This can be used to create a list item with fixed views.
     
     The other convenience initializers just call this using
     various view combinations.
     */
    init<Icon: View, Content: View, TrailingContent: View, TrailingIcon: View>(
        icon: Icon,
        title: Content,
        trailingContent: TrailingContent,
        trailingIcon: TrailingIcon) {
        self.init {
            Group {
                OptionalView(icon) { MenuListIcon($0) }
                title
                Spacer()
                trailingContent
                OptionalView(trailingIcon) { MenuListIcon($0) }
            }.any()
        }
    }
    
    init(
        icon: Image? = nil,
        title: String,
        subtitle: String? = nil,
        trailingIcon: Image? = nil) {
        self.init(
            icon: OptionalView(icon) { MenuListIcon($0) },
            title: MenuListText(title),
            trailingContent: OptionalView(subtitle) { MenuListSubtitle($0) },
            trailingIcon: OptionalView(trailingIcon) { MenuListIcon($0) }
        )
    }
    
    init<Icon: View>(
        icon: Icon,
        title: String,
        subtitle: String? = nil) {
        self.init(
            icon: icon,
            title: MenuListText(title),
            trailingContent: OptionalView(subtitle) { MenuListSubtitle($0) },
            trailingIcon: EmptyView()
        )
    }
    
    init<Icon: View, TrailingIcon: View>(
        icon: Icon,
        title: String,
        subtitle: String? = nil,
        trailingIcon: TrailingIcon) {
        self.init(
            icon: icon,
            title: MenuListText(title),
            trailingContent: OptionalView(subtitle) { MenuListSubtitle($0) },
            trailingIcon: trailingIcon
        )
    }
    
    init<Icon: View, Content: View, TrailingContent: View>(
        icon: Icon,
        title: Content,
        trailingContent: TrailingContent) {
        self.init(
            icon: icon,
            title: title,
            trailingContent: trailingContent,
            trailingIcon: EmptyView()
        )
    }
    
    init<Icon: View, Content: View, TrailingIcon: View>(
        icon: Icon,
        title: Content,
        trailingIcon: TrailingIcon) {
        self.init(
            icon: icon,
            title: title,
            trailingContent: EmptyView(),
            trailingIcon: trailingIcon
        )
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
public extension MenuListItem {
    
    /**
     Convert this item to a `Button` that performs an action.
     */
    func button(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            self
        }.buttonStyle(PlainButtonStyle())
    }

    /**
     Convert this item to a `Button` that performs an action
     that is a navigation action, e.g. present a sheet.
     
     This replaces any defined `trailingIcon` with a chevron.
     */
    func navigationButton(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            MenuListItem(isNavigationButton: true, content: content)
        }.buttonStyle(PlainButtonStyle())
    }
    
    /**
     Convert this item to a `NavigationLink`, that navigates
     to a certain destination view.
     
     This replaces any defined `trailingIcon` with `nil`.
     */
    func navigationLink<Destination: View>(to destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            body
        }
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
private extension MenuListItem {
    
    @ViewBuilder
    var trailingView: some View {
        if isNavigationButton {
            NavigationLinkArrow()
        } else {
            EmptyView()
        }
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
struct MenuListItem_Previews: PreviewProvider {
    
    static var icon: Image { Image(systemName: "checkmark.circle.fill") }
    
    static func item(_ text: String) -> MenuListItem<AnyView> {
        MenuListItem(icon: icon, title: text, trailingIcon: icon)
    }
    
    static var previews: some View {
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
