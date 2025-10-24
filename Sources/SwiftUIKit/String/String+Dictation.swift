//
//  String+Dictation.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-14.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// Clean up spaces and other characters that can be added during dictation,
    /// for instance when dictating text into a text field.
    func cleanedUpAfterDictation() -> String {
        self
            .replacingOccurrences(of: "\u{fffc}", with: "")
            .trimmingCharacters(in: .whitespaces)
    }
}
