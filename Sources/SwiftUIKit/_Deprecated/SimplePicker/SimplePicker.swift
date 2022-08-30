//
//  SimplePicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by a view that can be used
 as a simple picker.
 */
@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public protocol SimplePicker: View {}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public extension SimplePicker {
    
    /**
     This button builder function generates an `HStack` with
     a left text and a right, standard checkmark.
     */
    static func standardButtonBuilder<Value: SimplePickerValue>(
        _ value: Value,
        _ isSelected: Bool
    ) -> AnyView {
        HStack {
            Text(value.displayName)
            Spacer()
            if isSelected { Image(systemName: "checkmark") }
        }.any()
    }
}
