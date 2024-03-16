//
//  String+Capitalize.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-01-11.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// Capitalize the first letter in the string.
    func capitalizingFirstLetter() -> String {
        prefix(1).capitalized + dropFirst()
    }

    /// Capitalize the first letter in the string.
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
