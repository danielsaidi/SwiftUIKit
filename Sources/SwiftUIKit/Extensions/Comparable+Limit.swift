//
//  Comparable+Limit.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2018-10-04.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Comparable {
    
    /// Limit the value to a closed range.
    mutating func limit(to range: ClosedRange<Self>) {
        self = limited(to: range)
    }
    
    /// Return the value limited to a closed range.
    func limited(to range: ClosedRange<Self>) -> Self {
        if self < range.lowerBound { return range.lowerBound }
        if self > range.upperBound { return range.upperBound }
        return self
    }
}
