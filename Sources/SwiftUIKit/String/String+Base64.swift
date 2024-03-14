//
//  String+Base64.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//
//  More info:
//  https://danielsaidi.com/blog/2020/06/04/string-base64
//

import Foundation

public extension String {
    
    /// Base64 decode the string.
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Base64 encode the string.
    func base64Encoded() -> String? {
        data(using: .utf8)?.base64EncodedString()
    }
}
