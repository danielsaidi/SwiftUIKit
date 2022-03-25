//
//  TabViewItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-05.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)
import SwiftUI

@available(*, deprecated, message: "Use the native SwiftUI apis instead.")
public protocol TabViewItem: Hashable {
    
    var icon: Image { get}
    var title: String { get }
    var selectedIcon: Image { get }
    var selectedTitle: String { get }
}

@available(*, deprecated, message: "Use the native SwiftUI apis instead.")
public extension View {
    
    /**
     Use this function to bind any view in a `TabView` to an
     instance of a type that implements `TabViewItem`.
     */
    func tabItem<Type: TabViewItem>(_ item: Type, selection: Type) -> some View {
        self.tag(item)
            .tabItem {
                tabItemIcon(item, selection: selection)
                tabItemText(item, selection: selection)
            }
    }
    
    func tabItemIcon<Type: TabViewItem>(_ item: Type, selection: Type) -> some View {
        item == selection ? item.selectedIcon : item.icon
    }
    
    func tabItemText<Type: TabViewItem>(_ item: Type, selection: Type) -> some View {
        Text(item == selection ? item.selectedTitle : item.title)
    }
}
#endif
