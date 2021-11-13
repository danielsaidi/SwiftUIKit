//
//  String+Slugified.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This extension is internally used by ``TagTextView`` and is
 not public in order to not collide with `SwiftKit`.
 */
extension String {
    
    private static let allowedCharacters = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-")
    
    /**
     Convert the string to a slugified version that works to
     be used as a tag.
     
     For instance, `I'd love an AppleCar!` will be converted
     to "i-d-love-an-apple-car".
     */
    func slugified() -> String {
        self.lowercased()
            .components(separatedBy: String.allowedCharacters.inverted)
            .filter { $0 != "" }
            .joined(separator: "-")
    }
}
