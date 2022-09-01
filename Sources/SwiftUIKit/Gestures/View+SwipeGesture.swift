//
//  View+SwipeGesture.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if os(iOS) || os(macOS) || os(watchOS)
public extension View {
    
    /**
     This extension can be used to add a `SwipeGesture` to a
     `View` in a more declarative way.
     
     - Parameters:
       - maximumTime: The max time the gesture can be active before cancelling itself.
       - minimumDistance: The minimum distance in points the gesture must be dragged before it triggers.
       - maximumDistance: The maximum distance in points the gesture can be dragged before it cancels.
       - up: The action to trigger when the user swipes up.
       - left: The action to trigger when the user swipes left.
       - right: The action to trigger when the user swipes right.
       - down: The action to trigger when the user swipes down.
     */
    func onSwipeGesture(
        maximumTime: TimeInterval = 1,
        minimumDistance: CGFloat = 10,
        maximumDistance: CGFloat = 100_000,
        gestureTimer: GestureTimer = GestureTimer(),
        up: @escaping () -> Void = {},
        left: @escaping () -> Void = {},
        right: @escaping () -> Void = {},
        down: @escaping () -> Void = {}
    ) -> some View {
        self.gesture(
            DragGesture(minimumDistance: minimumDistance)
                .onChanged { _ in gestureTimer.start() }
                .onEnded { gesture in
                    guard gestureTimer.elapsedTime < maximumTime else { return }
                    let translation = gesture.translation
                    let absHeight = abs(translation.height)
                    let absWidth = abs(translation.width)
                    let isVertical = absHeight > absWidth
                    let points = isVertical ? absHeight : absWidth
                    if points > maximumDistance { return }
                    if isVertical {
                        if translation.height < 0 {
                            up()
                        } else {
                            down()
                        }
                    } else {
                        if translation.width < 0 {
                            left()
                        } else {
                            right()
                        }
                    }
                }
        )
    }
}
#endif
