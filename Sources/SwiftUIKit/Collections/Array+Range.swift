//
//  Array+Range.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-06-12.
//  Copyright © 2016-2026 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Array where Element: Comparable & Strideable {
    
    /// Create an array for a certain `range` with a certain
    /// `stepSize` between each value.
    init(
        _ range: ClosedRange<Element>,
        stepSize: Element.Stride
    ) {
        self = Array(
            stride(
                from: range.lowerBound,
                through: range.upperBound,
                by: stepSize
            )
        )
    }
}
