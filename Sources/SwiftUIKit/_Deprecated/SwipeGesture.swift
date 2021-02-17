//
//  SwipeGesture.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import UIKit

@available(iOS, deprecated, message: "SwipeGesture is deprecated and will be removed in SwiftUIKit 2.0. Use ")
public struct SwipeGesture: UIViewRepresentable {
    
    public init(
        up: @escaping Action = {},
        left: @escaping Action = {},
        right: @escaping Action = {},
        down: @escaping Action = {}) {
        self.actions = Actions(up: up, left: left, right: right, down: down)
    }
    
    public typealias Action = () -> Void
    public typealias Context = UIViewRepresentableContext<SwipeGesture>
    
    let actions: Actions
    
    public func makeUIView(context: Context) -> UIView {
        let coord = context.coordinator
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.addSwipeGesture(.up, target: coord, action: #selector(coord.swipeUp))
        view.addSwipeGesture(.left, target: coord, action: #selector(coord.swipeLeft))
        view.addSwipeGesture(.right, target: coord, action: #selector(coord.swipeRight))
        view.addSwipeGesture(.down, target: coord, action: #selector(coord.swipeDown))
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
    
    
    /**
     This struct stores swipe actions for a `SwipeGesture`.
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

    
    /**
     This class is used as swipe gesture target and selector
     target. It has action references to the swipe gesture's
     executable swipe actions.
     */
    public class Coordinator: NSObject {
        
        public init(gesture: SwipeGesture) {
            self.gesture = gesture
        }
        
        private let gesture: SwipeGesture
        
        @objc public func swipeLeft() { gesture.actions.left() }
        @objc public func swipeRight() { gesture.actions.right() }
        @objc public func swipeUp() { gesture.actions.up() }
        @objc public func swipeDown() { gesture.actions.down() }
    }
    
    public func makeCoordinator() -> SwipeGesture.Coordinator {
        Coordinator(gesture: self)
    }
}

private extension UIView {
    
    /**
     This extension is used to add a configured swipe action
     to any `UIView`.
     */
    func addSwipeGesture(_ direction: UISwipeGestureRecognizer.Direction, target: Any?, action: Selector) {
        let swipe = UISwipeGestureRecognizer(target: target, action: action)
        swipe.direction = direction
        addGestureRecognizer(swipe)
    }
}
#endif
