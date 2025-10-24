//
//  String+Bool.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /// Parse a potential boolean value in the string.
    ///
    /// This handles 1/0, yes/no, YES/NO, etc. and is good to parsing .plist files.
    var boolValue: Bool { (self as NSString).boolValue }
}
