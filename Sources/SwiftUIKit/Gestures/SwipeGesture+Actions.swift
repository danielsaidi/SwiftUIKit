//
//  SwipeGesture+Actions.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Foundation

public extension SwipeGesture {
    
    /**
     This struct is used to store all four swipe actions for
     a `SwipeGesture`.
     */
    struct Actions {
        
        init(
            up: @escaping Action = {},
            left: @escaping Action = {},
            right: @escaping Action = {},
            down: @escaping Action = {}) {
            self.up = up
            self.left = left
            self.right = right
            self.down = down
        }
        
        let up: Action
        let left: Action
        let right: Action
        let down: Action
    }
}
#endif
