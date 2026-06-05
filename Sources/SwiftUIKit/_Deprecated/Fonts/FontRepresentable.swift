//
//  FontRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022-2026 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import class AppKit.NSFont

@available(*, deprecated, message: "This has been moved to FontKit")
public typealias FontRepresentable = NSFont
#endif

#if canImport(UIKit)
import class UIKit.UIFont

@available(*, deprecated, message: "This has been moved to FontKit")
public typealias FontRepresentable = UIFont
#endif
