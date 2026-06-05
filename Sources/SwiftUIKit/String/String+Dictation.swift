//
//  String+Dictation.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-14.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// Clean up characters that can be added when dictating
    /// text into a text field.
    func cleanedUpAfterDictation() -> String {
        self
            .replacingOccurrences(of: "\u{fffc}", with: "")
            .trimmingCharacters(in: .whitespaces)
    }
}
