//
//  String+Replace.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-01-08.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//
//  Read more here:
//  https://danielsaidi.com/blog/2020/06/04/string-replace
//

import Foundation

public extension String {
    
    @available(*, deprecated, message: "Use the new options-based version instead.")
    func replacing(
        _ string: String,
        with: String,
        caseSensitive: Bool
    ) -> String {
        caseSensitive
            ? replacingOccurrences(of: string, with: with)
            : replacingOccurrences(of: string, with: with, options: .caseInsensitive)
    }
    
    /// Replace a certain string with another one.
    func replacing(
        _ string: String,
        with other: String,
        _ options: NSString.CompareOptions? = nil
    ) -> String {
        if let options {
            replacingOccurrences(of: string, with: other, options: options)
        } else {
            replacingOccurrences(of: string, with: other)
        }
    }
    
    /// Replace a certain string with another one.
    mutating func replace(
        _ string: String,
        with other: String,
        _ options: NSString.CompareOptions? = nil
    ) {
        self = self.replacing(string, with: other, options)
    }
}
