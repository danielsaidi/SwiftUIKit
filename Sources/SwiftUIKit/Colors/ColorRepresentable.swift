//
//  ColorRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import class AppKit.NSColor

/// This typealias bridges platform-specific color types.
public typealias ColorRepresentable = NSColor
#endif

#if canImport(UIKit)
import class UIKit.UIColor

/// This typealias bridges platform-specific color types.
public typealias ColorRepresentable = UIColor
#endif
