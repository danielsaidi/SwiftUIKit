//
//  MenuListToggle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 A menu list toggle is a specialized toggle that takes up as
 much vertical space as a menu list text view.
 */
public struct MenuListToggle<Icon: View>: View {
    
    public init(
        iconView: Icon,
        title: String,
        isOn: Binding<Bool>) {
        self.icon = iconView
        self.title = title
        self.isOn = isOn
    }
    
    private let icon: Icon?
    private let title: String
    private let isOn: Binding<Bool>
    
    public var body: some View {
        MenuListItemStack {
            if let icon = icon {
                MenuListIcon(icon)
            }
            Toggle(title, isOn: isOn)
                .padding(.vertical, 8)
        }
    }
}

extension MenuListToggle where Icon == Image {
    
    public init(
        _ title: String,
        isOn: Binding<Bool>) {
        self.icon = nil
        self.title = title
        self.isOn = isOn
    }
    
    public init(
        icon: Image,
        title: String,
        isOn: Binding<Bool>) {
        self.icon = icon
        self.title = title
        self.isOn = isOn
    }
}

struct MenuListToggle_Previews: PreviewProvider {
    
    static let icon = Image(systemName: "trash")
    
    static var previews: some View {
        List {
            MenuListToggle("foo", isOn: .constant(true))
            MenuListToggle(icon: icon, title: "foo", isOn: .constant(true))
            MenuListToggle(iconView: Color.red, title: "foo", isOn: .constant(true))
        }
    }
}
