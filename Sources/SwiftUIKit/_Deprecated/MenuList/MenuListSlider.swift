//
//  MenuListSlider.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 A menu list toggle is a specialized toggle that takes up as
 much vertical space as a menu list text view.
 */
@available(*, deprecated, message: "Use the new ListItem views instead")
public struct MenuListSlider<Icon: View, Value: Comparable & BinaryFloatingPoint>: View where Value.Stride: BinaryFloatingPoint {
    
    public init(
        iconView: Icon,
        title: String,
        value: Binding<Value>,
        in range: ClosedRange<Value>) {
        self.icon = iconView
        self.title = title
        self.value = value
        self.range = range
    }
    
    private let icon: Icon?
    private let title: String
    private let value: Binding<Value>
    private let range: ClosedRange<Value>
    
    public var body: some View {
        MenuListItemStack {
            if let icon = icon {
                MenuListIcon(icon)
            }
            MenuListText(title)
            Slider(value: value, in: range)
                .padding(.vertical, 8)
        }
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
extension MenuListSlider where Icon == Image {
    
    public init(
        _ title: String,
        value: Binding<Value>,
        in range: ClosedRange<Value>) {
        self.icon = nil
        self.title = title
        self.value = value
        self.range = range
    }
    
    public init(
        icon: Image,
        title: String,
        value: Binding<Value>,
        in range: ClosedRange<Value>) {
        self.icon = icon
        self.title = title
        self.value = value
        self.range = range
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
struct MenuListSlider_Previews: PreviewProvider {
    
    static let icon = Image(systemName: "trash")
    
    static var previews: some View {
        List {
            MenuListSlider("foo", value: .constant(1.0), in: 0...10)
            MenuListSlider(icon: icon, title: "foo", value: .constant(1.0), in: 0...10)
            MenuListSlider(iconView: Color.red, title: "foo", value: .constant(1.0), in: 0...10)
        }
    }
}
#endif
