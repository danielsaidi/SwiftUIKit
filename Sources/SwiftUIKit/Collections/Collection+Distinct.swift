//
//  Collection+Distinct.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Collection where Element: Hashable {
    
    /// Get distinct values in order from the collection.
    func distinct() -> [Element] {
        reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }
}
