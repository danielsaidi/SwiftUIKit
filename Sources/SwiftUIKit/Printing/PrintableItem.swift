//
//  PrintableItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-04-07.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum defines all supported printable types.
 
 To add new item types, all ``Printer`` implementations must
 be able to handle them.
 */
public enum PrintableItem {
    
    /// This will print a pdf file at a specific url.
    case pdf(url: URL)
}
