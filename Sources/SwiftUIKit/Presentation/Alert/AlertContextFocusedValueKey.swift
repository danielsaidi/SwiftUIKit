//
//  AlertContextFocusedValueKey.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-31.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This key can be used to keep track of the currently focused
 alert context.
 
 To apply it to a view, just use the `focusedValue` modifier:
 
 ```swift
 .focusedValue(\.alertContext, alertContext)
 ```
 
 To access the focus value, e.g. in a menu command, just use
 the `@FocusedValue` property wrapper:
 
 ```swift
 @FocusedValue(\.alertContext)
 private var alertContext: AlertContext?
 ```
 */
public struct AlertContextFocusedValueKey: FocusedValueKey {
    
    public typealias Value = AlertContext
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension FocusedValues {
    
    var alertContext: AlertContextFocusedValueKey.Value? {
        get { self[AlertContextFocusedValueKey.self] }
        set { self[AlertContextFocusedValueKey.self] = newValue }
    }
}
