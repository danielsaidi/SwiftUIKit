//
//  FontIdentifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by classes or structs that
 can be used to identify a font.
 
 You can e.g. use this to make it possible to use SwiftGen's
 `FontConvertible` with the `View+Font` extension. Just make
 the type you want to use conform to this protocol.
 */
public protocol FontIdentifier {
    
    var fontName: String { get }
}
