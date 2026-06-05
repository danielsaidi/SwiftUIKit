//
//  SidebarListRowBackgroundModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-08-16.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

public extension View {

    /// Apply a sidebar list row background color.
    ///
    /// Unlike `.listRowBackground`, this has no effect when
    /// the sidebar is presented in regular sized interfaces.
    func sidebarListRowBackground(
        _ color: Color
    ) -> some View {
        self.modifier(SidebarListRowBackgroundModifier(color))
    }
    
    /// Apply a sidebar list row background style.
    ///
    /// Unlike `.listRowBackground`, this has no effect when
    /// the sidebar is presented in regular sized interfaces. 
    func sidebarListRowBackground<Style: View>(
        _ style: Style
    ) -> some View {
        self.modifier(SidebarListRowBackgroundModifier(style))
    }
}

/// This modifier can be used to apply a list row background
/// to a list that appears in the sidebar.
///
/// Unlike `listRowBackground` this has no effect on regular
/// sized lists, since such sidebars has now row backgrounds.
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
