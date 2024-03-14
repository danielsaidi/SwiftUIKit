//
//  Sequence+Batch.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2017-05-10.
//  Copyright © 2017-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Sequence {
  
    /// Batch the sequence into groups of a certain size.
    func batched(withBatchSize size: Int) -> [[Element]] {
        var result: [[Element]] = []
        var batch: [Element] = []
        
        forEach {
            batch.append($0)
            if batch.count == size {
                result.append(batch)
                batch = []
            }
        }
        
        if !batch.isEmpty {
            result.append(batch)
        }
        
        return result
    }
}
