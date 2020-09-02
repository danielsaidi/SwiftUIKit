//
//  UIView+SwipeGestures.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

extension UIView {
    
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
