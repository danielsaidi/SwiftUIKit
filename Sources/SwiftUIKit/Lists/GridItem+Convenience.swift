//
//  GridItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-08-30.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension GridItem {
    
    /// Several items in the space of a single flexible item.
    static func adaptive(minimum: CGFloat, maximum: CGFloat) -> Self {
        .init(.adaptive(minimum: minimum, maximum: maximum))
    }
    
    /// A single item with the specified fixed size.
    static func fixed(_ size: CGFloat) -> Self {
        .init(.fixed(size))
    }
    
    /// A single flexible item.
    static func flexible(minimum: CGFloat, maximum: CGFloat) -> Self {
        .init(.flexible(minimum: minimum, maximum: maximum))
    }
}

public extension Collection where Element == GridItem {
    
    /// Several items in the space of a single flexible item.
    static func adaptive(minimum: CGFloat, maximum: CGFloat) -> [Element] {
        [.adaptive(minimum: minimum, maximum: maximum)]
    }
    
    /// A single item with the specified fixed size.
    static func fixed(_ size: CGFloat) -> [Element] {
        [.fixed(size)]
    }
    
    /// Multiple items with the specified fixed sizes.
    static func fixed(_ sizes: [CGFloat]) -> [Element] {
        sizes.map { .fixed($0) }
    }
    
    /// A single flexible item.
    static func flexible(minimum: CGFloat, maximum: CGFloat) -> [Element] {
        [.flexible(minimum: minimum, maximum: maximum)]
    }
}
