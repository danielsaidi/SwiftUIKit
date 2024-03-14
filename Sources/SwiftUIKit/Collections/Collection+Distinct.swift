//
//  Collection+Distinct.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Collection where Element: Hashable {
    
    /// Get distinct elements from the collection.
    ///
    /// This operation will preserve the collection order.
    func distinct() -> [Element] {
        reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }
}
