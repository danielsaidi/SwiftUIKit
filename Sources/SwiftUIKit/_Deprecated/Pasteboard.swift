//
//  Pasteboard.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-17.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if os(macOS)
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/StandardActions")
public typealias Pasteboard = NSPasteboard
#elseif os(iOS)
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/StandardActions")
public typealias Pasteboard = UIPasteboard
#endif

#if os(macOS) || os(iOS)
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/StandardActions")
public extension Pasteboard {
    
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
