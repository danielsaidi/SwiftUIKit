//
//  SidebarListRowBackgroundModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-08-16.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

public extension View {

    /**
     Apply a list row background color for a sidebar list.
     
     Unlike `listRowBackground`, this will check if the list
     is being rendered on a regular sized device. If so, the
     provided color will be ignored.
     */
    func sidebarListRowBackground(
        _ color: Color
    ) -> some View {
        self.modifier(SidebarListRowBackgroundModifier(color))
    }
    
    /**
     Apply a list row background view for a sidebar list.
     
     Unlike `listRowBackground`, this will check if the list
     is being rendered on a regular sized device. If so, the
     provided view will be ignored.
     */
    func sidebarListRowBackground<Style: View>(
        _ style: Style
    ) -> some View {
        self.modifier(SidebarListRowBackgroundModifier(style))
    }
}

/**
 This modifier can be used to apply a list row background to
 a list that appears in the sidebar.
 
 Unlike `listRowBackground`, this modifier will check if the
 list is being rendered on a regular sized device. If so, it
 will ignore the background, since a sidebar by default does
 not use a list row background on iPad.
 */
public struct SidebarListRowBackgroundModifier<Style: View>: ViewModifier {
    
    public init(_ style: Style) {
        self.style = style
    }
    
    private let style: Style

    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass

    public func body(content: Content) -> some View {
        if horizontalSizeClass == .regular {
            content
        } else {
            content.listRowBackground(style)
        }
    }
}
#endif
