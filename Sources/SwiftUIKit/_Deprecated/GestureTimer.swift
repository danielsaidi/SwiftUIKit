//
//  GestureTimer.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-17.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/FlipKit")
public class GestureTimer {
    
    public init() {}
    
    private var date: Date?
    
    /// The elapsed time since ``start()`` was called.
    public var elapsedTime: TimeInterval {
        guard let date = date else { return 0 }
        return Date().timeIntervalSince(date)
    }
    
    /// Start the timer.
    public func start() {
        if date != nil { return }
        date = Date()
    }
}
