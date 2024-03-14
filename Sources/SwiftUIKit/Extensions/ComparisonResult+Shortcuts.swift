//
//  ComparisonResult+Shortcuts.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ComparisonResult {
    
    /// This is a shorthand for `.orderedAscending`.
    static var ascending: ComparisonResult {
        .orderedAscending
    }
    
    /// This is a shorthand for `.orderedDescending`.
    static var descending: ComparisonResult {
        .orderedDescending
    }
}
