//
//  JSONDecoder+Date.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018-2023 Daniel Saidi. All rights reserved.
//

import Foundation

public extension JSONDecoder {
    
    /// Create a `JSONDecoder` that can decode ISO8601.
    static var iso8601: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .robustISO8601
        return decoder
    }
}

private extension JSONDecoder.DateDecodingStrategy {
    
    /**
     This strategy parses ISO8601 dates robustly and is also
     parse both milliseconds and seconds.
     */
    static let robustISO8601 = custom { decoder throws -> Date in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        let msFormatter = DateFormatter.iso8601Milliseconds
        let secFormatter = DateFormatter.iso8601Seconds
        if let date = msFormatter.date(from: string) ?? secFormatter.date(from: string) { return date }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}
