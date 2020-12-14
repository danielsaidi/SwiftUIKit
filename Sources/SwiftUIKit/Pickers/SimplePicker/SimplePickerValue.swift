//
//  SimplePickerValue.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol must be implemented by any value type that is
 to be used in a simple picker.
 */
public protocol SimplePickerValue: Identifiable {
    
    var displayName: String { get }
}
