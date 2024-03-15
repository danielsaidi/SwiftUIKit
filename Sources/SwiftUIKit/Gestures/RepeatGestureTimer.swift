//
//  RepeatGestureTimer.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-01-28.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class is used to handle repeating actions on a gesture.

 The ``shared`` instance can be used if only a single button
 can be pressed to repeat a certain action at any given time.
 */
public class RepeatGestureTimer {

    /// Create a repeat gesture timer.
    ///
    /// - Parameters:
    ///   - repeatInterval: The repeat time interval.
    public init(
        repeatInterval: TimeInterval = 0.4
    ) {
        self.repeatInterval = repeatInterval
    }

    deinit { stop() }

    
    /// A shared singleton instance.
    public static let shared = RepeatGestureTimer()

    /// The repeat time interval.
    public var repeatInterval: TimeInterval


    private var timer: Timer?

    private var startDate: Date?
}

public extension RepeatGestureTimer {

    /// The elapsed time since the timer was started.
    var duration: TimeInterval? {
        guard let date = startDate else { return nil }
        return Date().timeIntervalSince(date)
    }

    /// Whether or not the timer is active.
    var isActive: Bool { timer != nil }

    /// Start the repeat gesture timer with a certain action.
    func start(action: @escaping () -> Void) {
        if isActive { return }
        stop()
        startDate = Date()
        timer = Timer.scheduledTimer(
            withTimeInterval: repeatInterval,
            repeats: true) { _ in action() }
    }

    /// Stop the repeat gesture timer.
    func stop() {
        timer?.invalidate()
        timer = nil
        startDate = nil
    }
}

extension RepeatGestureTimer {

    func modifyStartDate(to date: Date) {
        startDate = date
    }
}
