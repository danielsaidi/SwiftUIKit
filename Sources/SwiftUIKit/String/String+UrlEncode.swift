//
//  String+UrlEncode.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//
//  https://danielsaidi.com/blog/2020/06/04/string-urlencode
//

import Foundation

public extension String {

    /// Encode the string for `x-www-form-urlencoded`.
    ///
    /// This uses `urlEncoded()` then replaces `+` with `%2B`.
    func formEncoded() -> String? {
        self.urlEncoded()?
            .replacingOccurrences(of: "+", with: "%2B")
    }

    /// Encode the string to work with quary parameters.
    ///
    /// This uses `addingPercentEncoding` & `.urlPathAllowed`
    /// then replaces every `&` with `%26`.
    func urlEncoded() -> String? {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)?
            .replacingOccurrences(of: "&", with: "%26")
    }
}
