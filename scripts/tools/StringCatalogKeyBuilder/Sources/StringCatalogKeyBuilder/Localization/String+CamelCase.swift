//
//  String+StringCatalog.swift
//  SwiftPackageScripts
//
//  Created by Daniel Saidi on 2025-12-01.
//  Copyright © 2025-2026 Daniel Saidi. All rights reserved.
//

import Foundation

extension String {

    func splitCamelCase() -> [String] {
        var words: [String] = []
        var currentWord = ""

        for char in self {
            if char.isUppercase, !currentWord.isEmpty {
                words.append(currentWord)
                currentWord = String(char)
            } else {
                currentWord.append(char)
            }
        }

        if !currentWord.isEmpty {
            words.append(currentWord)
        }

        return words
    }
}

extension Collection where Element == String {

    func toCamelCase() -> String {
        self.enumerated().map { index, word in
            let lowercased = word.lowercased()
            return index == 0 ? lowercased : lowercased.prefix(1).uppercased() + lowercased.dropFirst()
        }.joined()
    }
}
