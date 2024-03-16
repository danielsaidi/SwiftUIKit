//
//  String+Dictation.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-14.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// Clean up any spaces and other characters that can be
    /// added to the string during dictation.
    ///
    /// This happens on the Apple TV, when using a remote to
    /// dictate text into a text field.
    func cleanedUpAfterDictation() -> String {
        self
            .replacingOccurrences(of: "\u{fffc}", with: "")
            .trimmingCharacters(in: .whitespaces)
    }
}
