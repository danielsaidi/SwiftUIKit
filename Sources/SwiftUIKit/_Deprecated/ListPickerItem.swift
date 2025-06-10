//
//  ListPickerItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public protocol ListPickerItem: View {
    
    associatedtype Item: Equatable
    
    var item: Item { get }
    var isSelected: Bool { get }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public extension ListPickerItem {
    
    /// This checkmark image to use for the selection state.
    var checkmark: some View {
        Image(systemName: "checkmark")
            .visible(if: isSelected)
    }
}
