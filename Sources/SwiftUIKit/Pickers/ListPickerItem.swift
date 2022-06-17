//
//  ListPickerItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by `PickerItem` list items.
 
 The ``ListPickerItem/checkmark`` returns a checkmark if the
 item is selected, or an empty image if it's not. You should
 use the checkmark as a trailing icon to show if the item is
 selected or not.
 */
public protocol ListPickerItem: View {
    
    associatedtype Item: Equatable
    
    var item: Item { get }
    var isSelected: Bool { get }
}

public extension ListPickerItem {
    
    /**
     This property returns a checkmark image when an item is
     selected, else an empty image placeholder.
     */
    var checkmark: some View {
        Image(systemName: "checkmark")
            .visible(if: isSelected)
    }
}
