//
//  JSONEncoder+Date.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension JSONEncoder {
    
    /// Create a `JSONEncoder` that can encode ISO8601.
    static var iso8601: JSONEncoder {
        let decoder = JSONEncoder()
        decoder.dateEncodingStrategy = .customISO8601
        return decoder
    }
}

private extension JSONEncoder.DateEncodingStrategy {
    
    /// A strategy that can encode ISO8601 dates robustly.
    static let customISO8601 = custom { (date, encoder) throws -> Void in
        let formatter = DateFormatter.iso8601Milliseconds
        let string = formatter.string(from: date)
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
