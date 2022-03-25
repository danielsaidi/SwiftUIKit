//
//  MenuList.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This list wraps a native `List`, then applies a title to it.
 You can also provide a list style, which by default will be
 the platform default.
 
 You can override the default style for all menu-based lists
 by setting `MenuListStyle.defaultStyle` to a value. You can
 also provide a specific style in `init`.
 */
@available(*, deprecated, message: "Use the new ListItem views instead")
public struct MenuList<Content: View>: View {
    
    public init(
        _ title: String = "",
        style: MenuListStyle = MenuListStyle.defaultStyle,
        @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.style = style
        self.content = content
    }
    
    private let title: String
    private let style: MenuListStyle
    private let content: () -> Content
    
    public var body: some View {
        List {
            content()
        }
        .title(title)
        .listStyle(style)
    }
}

// MARK: - Private Stuff

@available(*, deprecated, message: "Use the new ListItem views instead")
private extension View {
    
    @ViewBuilder
    func title(_ title: String) -> some View {
        #if os(iOS) || os(watchOS) || os(tvOS)
        self.navigationBarTitle(title)
        #else
        self
        #endif
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
struct MenuList_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuListStyle.defaultStyle = .grouped
        
        return MenuList("List", style: .groupedWithInsets) {
            Text("This")
            Text("is")
            Text("a")
            Text("Spartan")
            Text("list!")
        }
    }
}
