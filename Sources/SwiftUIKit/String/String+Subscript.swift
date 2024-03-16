//
//  String+Subscript.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-29.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This extension makes it possible to fetch characters from a
 string, as discussed here:
 
 https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
 */
public extension StringProtocol {
    
    func character(
        at index: Int
    ) -> String.Element? {
        guard count > index else { return nil }
        return self[index]
    }
    
    func character(
        at index: UInt
    ) -> String.Element? {
        character(at: Int(index))
    }
    
    subscript(
        _ offset: Int
    ) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(
        _ range: Range<Int>
    ) -> SubSequence {
        prefix(range.lowerBound+range.count).suffix(range.count)
    }
    
    subscript(
        _ range: ClosedRange<Int>
    ) -> SubSequence {
        prefix(range.lowerBound+range.count).suffix(range.count)
    }
    
    subscript(
        _ range: PartialRangeThrough<Int>
    ) -> SubSequence {
        prefix(range.upperBound.advanced(by: 1))
    }
    
    subscript(
        _ range: PartialRangeUpTo<Int>
    ) -> SubSequence {
        prefix(range.upperBound)
    }
    
    subscript(
        _ range: PartialRangeFrom<Int>
    ) -> SubSequence {
        suffix(Swift.max(0, count-range.lowerBound))
    }
}

private extension LosslessStringConvertible {
    
    var string: String { .init(self) }
}

private extension BidirectionalCollection {
    
    subscript(safe offset: Int) -> Element? {
        if isEmpty { return nil }
        guard let index = index(
            startIndex,
            offsetBy: offset,
            limitedBy: index(before: endIndex))
        else { return nil }
        return self[index]
    }
}
