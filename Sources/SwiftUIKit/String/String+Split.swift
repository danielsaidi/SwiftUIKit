//
//  String+Split.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-23.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {

    /// Split the string using a list of separators.
    func split(by separators: [String]) -> [String] {
        let separators = CharacterSet(charactersIn: separators.joined())
        return components(separatedBy: separators)
    }
}
