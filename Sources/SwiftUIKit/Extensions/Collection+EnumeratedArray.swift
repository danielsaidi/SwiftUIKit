//
//  Collection+EnumeratedArray.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Collection {

    /**
     Convert the collection to an enumerated array.

     This streamlines using `ForEach` since you can now type:

     ```swift
     ForEach(collection.enumeratedArray()), id: \.offset) {
         content($0.element)
     }
     ```

     instead of:

     ```swift
     ForEach(Array(collection.enumerated()), id: \.offset) {
         content($0.element)
     }
     ```
     */
    func enumeratedArray() -> [EnumeratedSequence<Self>] {
        Array(enumerated())
    }
}
