//
//  View+SwipeGesture.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if os(iOS)
public extension View {
    
    /**
     This extension can be used to add a `SwipeGesture` to a
     `View` in a more declarative way.
     */
    func onSwipeGesture(
        up: @escaping SwipeGesture.Action = {},
        left: @escaping SwipeGesture.Action = {},
        right: @escaping SwipeGesture.Action = {},
        down: @escaping SwipeGesture.Action = {}) -> some View {
        let gesture = SwipeGesture(up: up, left: left, right: right, down: down)
        return overlay(gesture)
    }
}
#endif
