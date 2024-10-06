//
//  ValidationRegex.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/// This type can be used for regex-based string validation.
public struct ValidationRegex {
    
    public init(_ expression: String) {
        self.expression = expression
    }
    
    public let expression: String
}

public extension ValidationRegex {
    
    /// An e-mail validation regex.
    static var email: Self {
        .init("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,} ?")
    }
}

public extension ValidationRegex {
    
    /// Check if the string is valid for this regex.
    func validateString(
        _ string: String
    ) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", expression)
        return predicate.evaluate(with: string)
    }
}

public extension String {
    
    /// Check if the string is valid for a certain regex.
    func isValid(_ regex: ValidationRegex) -> Bool {
        regex.validateString(self)
    }
}
