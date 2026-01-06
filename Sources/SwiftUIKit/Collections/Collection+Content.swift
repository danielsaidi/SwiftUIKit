//
//  Collection+Content.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Collection {
    
    /// This is an inverse `isEmpty` check.
    var hasContent: Bool { !isEmpty }
}
