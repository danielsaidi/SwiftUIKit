//
//  Flippable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by anything (most probably
 views) that can be flipped, e.g. the `FlippableView`.
 */
public protocol Flippable {
    
    func flip(_ direction: FlipDirection)
}
