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
 internal in order to not collide with `SwiftKit`.
 */
extension String {
    
    /**
     Convert the string to a slugified version that works to
     be used as a tag.
     
     For instance, `I'd love an AppleCar!` will be converted
     to "i-d-love-an-apple-car".

     - Parameters:
       - separator: The separator to use in the slugified string, by default `-`.
       - allowedCharacters: The characters to allow in the slugified string, by default alphanumerical characters and `-`.
     */
    func slugified(
        separator: String = "-",
        allowedCharacters: NSCharacterSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-")
    ) -> String {
        self.lowercased()
            .components(separatedBy: allowedCharacters.inverted)
            .filter { !$0.isEmpty }
            .joined(separator: separator)
    }
}
