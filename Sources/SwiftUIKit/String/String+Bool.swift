//
//  String+Bool.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    /**
     Parse the potential bool value in the string.
     
     This function handles 1/0, yes/no, YES/NO etc., so it's
     a good alternative to use e.g. when parsing plist files.
     */
    var boolValue: Bool { (self as NSString).boolValue }
}
