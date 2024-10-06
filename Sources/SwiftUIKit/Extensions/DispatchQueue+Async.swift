//
//  DispatchQueue+Async.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-02.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020/06/03/dispatch-queue
//

import Foundation

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
