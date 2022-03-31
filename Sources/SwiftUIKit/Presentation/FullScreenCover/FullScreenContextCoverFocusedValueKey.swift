//
//  FullScreenCoverContextFocusedValueKey.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-31.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This key can be used to keep track of the currently focused
 full screen cover context.
 
 To apply it to a view, just use the `focusedValue` modifier:
 
 ```swift
 .focusedValue(\.fullscreenCoverContext, fullscreenCoverContext)
 ```
 
 To access the focus value, e.g. in a menu command, just use
 the `@FocusedValue` property wrapper:
 
 ```swift
 @FocusedValue(\.fullscreenCoverContext)
 private var fullscreenCoverContext: FullscreenCoverContext?
 ```
 */
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct FullScreenCoverContextFocusedValueKey: FocusedValueKey {
    
    public typealias Value = FullScreenCoverContext
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension FocusedValues {
    
    var fullScreenCoverContext: FullScreenCoverContextFocusedValueKey.Value? {
        get { self[FullScreenCoverContextFocusedValueKey.self] }
        set { self[FullScreenCoverContextFocusedValueKey.self] = newValue }
    }
}
