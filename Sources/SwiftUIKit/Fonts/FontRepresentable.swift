//
//  FontRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import class AppKit.NSFont

/// This typealias bridges platform-specific font types.
public typealias FontRepresentable = NSFont
#endif

#if canImport(UIKit)
import class UIKit.UIFont

/// This typealias bridges platform-specific font types.
public typealias FontRepresentable = UIFont
#endif
