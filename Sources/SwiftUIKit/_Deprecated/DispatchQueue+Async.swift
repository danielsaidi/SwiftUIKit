//
//  DispatchQueue+Async.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-02.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020/06/03/dispatch-queue
//

import Foundation

@available(*, deprecated, message: "This is no longer used within the library and will be removed in the next major release.")
public extension DispatchQueue {
    
    /// Perform an operation after a certain time interval.
    func asyncAfter(
        _ interval: DispatchTimeInterval,
        execute: @escaping @Sendable () -> Void
    ) {
        asyncAfter(deadline: .now() + interval) {
            execute()
        }
    }
}
