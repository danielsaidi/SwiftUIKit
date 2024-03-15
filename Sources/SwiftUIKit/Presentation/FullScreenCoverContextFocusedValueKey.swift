//
//  FullScreenCoverContextFocusedValueKey.swift
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
 .focusedValue(\.fullscreenCoverContext, context)
 ```
 
 To access the focus value, e.g. in a menu command, just use
 the `@FocusedValue` property wrapper:
 
 ```swift
 @FocusedValue(\.fullscreenCoverContext)
 var fullscreenCoverContext: FullscreenCoverContext?
 ```
 */
public struct FullScreenCoverContextFocusedValueKey: FocusedValueKey {
    
    public typealias Value = FullScreenCoverContext
}

public extension FocusedValues {
    
    var fullScreenCoverContext: FullScreenCoverContextFocusedValueKey.Value? {
        get { self[FullScreenCoverContextFocusedValueKey.self] }
        set { self[FullScreenCoverContextFocusedValueKey.self] = newValue }
    }
}
