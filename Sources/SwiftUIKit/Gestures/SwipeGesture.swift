//
//  SwipeGesture.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import UIKit

/**
 This gesture can be added to any `View` and will trigger an
 action whenever the user swipes in a certain direction.
 
 This gesture supports specifying a separate action for each
 possible swipe direction.
 
 The easiest way to apply this gesture to a `View` is to use
 the `onSwipeGesture` `View` extension.
 
 `IMPORTANT` For now, this gesture steals any gesture events
 that are added before it. Until this is fixed, make sure to
 add tap actions, long press actions etc. after this gesture.
 */
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
}
