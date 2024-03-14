//
//  String+Characters.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-29.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String.Element {
    
    static let backspace: String.Element = "\u{7f}"
    static let carriageReturn: String.Element = "\r"
    static let newLine: String.Element = "\n"
    static let space: String.Element = " "
    static let tab: String.Element = "\t"
}

public extension String {
    
    static let backspace = String(.backspace)
    static let carriageReturn = String(.carriageReturn)
    static let newLine = String(.newLine)
    static let space = String(.space)
    static let tab = String(.tab)
}
