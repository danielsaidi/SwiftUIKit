//
//  SwipeGesture+Coordinator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if os(iOS)
public extension SwipeGesture {
    
    /**
     This class is used as swipe gesture target and selector
     target. It has action references to the swipe gesture's
     executable swipe actions.
     */
    class Coordinator: NSObject {
        
        public init(gesture: SwipeGesture) {
            self.gesture = gesture
        }
        
        private let gesture: SwipeGesture
        
        @objc public func swipeLeft() { gesture.actions.left() }
        @objc public func swipeRight() { gesture.actions.right() }
        @objc public func swipeUp() { gesture.actions.up() }
        @objc public func swipeDown() { gesture.actions.down() }
    }
    
    func makeCoordinator() -> SwipeGesture.Coordinator {
        Coordinator(gesture: self)
    }
}
#endif
