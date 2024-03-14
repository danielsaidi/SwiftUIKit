//
//  String+Trimmed.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-15.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// This is a shorthand for `trimmingCharacters(in:)`.
    func trimmed(
        for set: CharacterSet = .whitespacesAndNewlines
    ) -> String {
        self.trimmingCharacters(in: set)
    }
}
