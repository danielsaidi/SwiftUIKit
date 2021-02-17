//
//  GestureTimer.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This timer can be used to calculate the elapsed time of any
 gesture. Just call `start` when the gesture starts then use
 `elapsedTime` to see how long time that has elapsed.
 */
public class GestureTimer {
    
    public init() {}
    
    private var date: Date?
    
    /**
     The time that has elapsed since `start` was called.
     */
    var elapsedTime: TimeInterval {
        guard let date = date else { return 0 }
        return Date().timeIntervalSince(date)
    }
    
    /**
     Start the timer.
     */
    func start() {
        if date != nil { return }
        date = Date()
    }
}
