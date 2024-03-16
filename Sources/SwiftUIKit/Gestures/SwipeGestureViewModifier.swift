//
//  SwipeGestureViewModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-03.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS) || os(watchOS) || os(visionOS)
import SwiftUI

/**
 This view modifier can apply swipe gestures to a view, that
 trigger actions when being swiped in certain directions.
 
 You can apply this with the `.onSwipeGesture` view modifier.
 */
public struct SwipeGestureViewModifier: ViewModifier {

    /// Create a swipe gesture view modifier.
    ///
    /// - Parameters:
    ///   - maximumTime: The max time the gesture can be active before cancelling itself, by default `1`.
    ///   - minimumDistance: The minimum distance in points the gesture must be dragged before it triggers, by default `10`.
    ///   - maximumDistance: The maximum distance in points the gesture can be dragged before it cancels, by default `100_000`.
    ///   - up: The action to trigger when the user swipes up, if any.
    ///   - left: The action to trigger when the user swipes left, if any.
    ///   - right: The action to trigger when the user swipes right, if any.
    ///   - down: The action to trigger when the user swipes down, if any.
    public init(
        maximumTime: TimeInterval = 1,
        minimumDistance: CGFloat = 10,
        maximumDistance: CGFloat = 100_000,
        gestureTimer: GestureTimer = GestureTimer(),
        up: Action? = nil,
        left: Action? = nil,
        right: Action? = nil,
        down: Action? = nil
    ) {
        self.maximumTime = maximumTime
        self.minimumDistance = minimumDistance
        self.maximumDistance = maximumDistance
        self.gestureTimer = gestureTimer
        self.up = up
        self.left = left
        self.right = right
        self.down = down
    }

    public var maximumTime: TimeInterval
    public var minimumDistance: CGFloat
    public var maximumDistance: CGFloat
    public var gestureTimer: GestureTimer
    public var up: Action?
    public var left: Action?
    public var right: Action?
    public var down: Action?

    public typealias Action = () -> Void

    public func body(content: Content) -> some View {
        content.gesture(
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
                            up?()
                        } else {
                            down?()
                        }
                    } else {
                        if translation.width < 0 {
                            left?()
                        } else {
                            right?()
                        }
                    }
                }
        )
    }
}

public extension View {
    
    /// Add swipe gestures that are triggered when this view
    /// is swiped in any of the specified directions.
    ///
    /// - Parameters:
    ///   - maximumTime: The max time the gesture can be active before cancelling itself, by default `1`.
    ///   - minimumDistance: The minimum distance in points the gesture must be dragged before it triggers, by default `10`.
    ///   - maximumDistance: The maximum distance in points the gesture can be dragged before it cancels, by default `100_000`.
    ///   - up: The action to trigger when the user swipes up, if any.
    ///   - left: The action to trigger when the user swipes left, if any.
    ///   - right: The action to trigger when the user swipes right, if any.
    ///   - down: The action to trigger when the user swipes down, if any.
    func onSwipeGesture(
        maximumTime: TimeInterval = 1,
        minimumDistance: CGFloat = 10,
        maximumDistance: CGFloat = 100_000,
        gestureTimer: GestureTimer = GestureTimer(),
        up: SwipeGestureViewModifier.Action? = nil,
        left: SwipeGestureViewModifier.Action? = nil,
        right: SwipeGestureViewModifier.Action? = nil,
        down: SwipeGestureViewModifier.Action? = nil
    ) -> some View {
        self.modifier(
            SwipeGestureViewModifier(
                maximumTime: maximumTime,
                minimumDistance: minimumDistance,
                maximumDistance: maximumDistance,
                gestureTimer: gestureTimer,
                up: up,
                left: left,
                right: right,
                down: down
            )
        )
    }
}
#endif
