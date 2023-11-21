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
#else
public typealias Pasteboard = UIPasteboard
#endif

public extension Pasteboard {
    
    func setString(_ string: String) {
        #if os(macOS)
        clearContents()
        setString(string, forType: .string)
        #else
        self.string = string
        #endif
    }
}
