//
//  Sequence+Group.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Sequence {

    /// Group the sequence into a dictionary.
    ///
    /// The operation can use any property from the items as
    /// the dictionary key.
    func grouped<T>(by grouper: (Element) -> T) -> [T: [Element]] {
        Dictionary(grouping: self, by: grouper)
    }
}
