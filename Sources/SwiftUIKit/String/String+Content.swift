//
//  String+Content.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-05.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// Check if this string has any content.
    var hasContent: Bool {
        !isEmpty
    }
    
    /// Check if this string has any content after trimming.
    var hasTrimmedContent: Bool {
        !trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
