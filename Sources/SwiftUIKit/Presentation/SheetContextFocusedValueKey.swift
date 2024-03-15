//
//  SheetContextFocusedValueKey.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-31.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This key can be used to keep track of the currently focused
 context within a multi-window app.
 
 To apply it to a view, just use the `focusedValue` modifier
 with your context instance:
 
 ```swift
 .focusedValue(\.sheetContext, context)
 ```
 
 To access the focus value, e.g. in a menu command, just use
 the `@FocusedValue` property wrapper:
 
 ```swift
 @FocusedValue(\.sheetContext)
 private var sheetContext: SheetContext?
 ```
 */
public struct SheetContextFocusedValueKey: FocusedValueKey {
    
    public typealias Value = SheetContext
}

public extension FocusedValues {
    
    var sheetContext: SheetContextFocusedValueKey.Value? {
        get { self[SheetContextFocusedValueKey.self] }
        set { self[SheetContextFocusedValueKey.self] = newValue }
    }
}
