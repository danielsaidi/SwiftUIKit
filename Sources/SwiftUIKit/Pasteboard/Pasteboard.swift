//
//  Pasteboard.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-17.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if os(macOS)
public typealias Pasteboard = NSPasteboard
#elseif os(iOS) || os(tvOS)
public typealias Pasteboard = UIPasteboard
#endif

#if os(macOS) || os(iOS) || os(tvOS)
public extension Pasteboard {
    
    /// Copy a string to the pasteboard.
    func copy(_ string: String) {
        #if os(macOS)
        clearContents()
        setString(string, forType: .string)
        #else
        self.string = string
        #endif
    }
}
#endif
