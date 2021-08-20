//
//  PickerListItem.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by `PickerItem` list items.
 
 The `checkmark` property returns a checkmark if the item is
 selected, or an empty image if it's not. You should use the
 checkmark as a trailing icon to show if an item is selected
 or not, unless you do this in some other way.
 */
public protocol PickerListItem: View {
    
    associatedtype Item: Equatable
    
    var item: Item { get }
    var isSelected: Bool { get }
}

public extension PickerListItem {
    
    /**
     This property returns a checkmark image when an item is
     selected, else an empty image placeholder.
     */
    var checkmark: some View {
        Image(systemName: "checkmark")
            .visible(if: isSelected)
    }
}