//
//  MenuListStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This enum has various styles that can be used on menu lists.
 
 If a style is not available for a certain platform, it will
 fallback to the default style for the platform.
 */
@available(*, deprecated, message: "Use the new ListItem views instead")
public enum MenuListStyle {
    
    case `default`, plain, grouped, groupedWithInsets
    
    public static var defaultStyle: MenuListStyle = .default
}

public extension View {
    
    @ViewBuilder
    func listStyle(_ style: MenuListStyle) -> some View {
        switch style {
        case .`default`: self
        case .plain: self.listStyle(PlainListStyle())
        case .grouped:
            #if os(iOS) || os(tvOS)
            self.listStyle(GroupedListStyle())
            #else
            self
            #endif
        case .groupedWithInsets:
            #if os(iOS)
            if #available(iOS 14.0, *) {
                self.listStyle(InsetGroupedListStyle())
            } else {
                self
            }
            #else
            self
            #endif
        }
    }
}
