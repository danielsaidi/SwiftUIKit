//
//  ColorRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import class AppKit.NSColor

/**
 This typealias helps bridging UIKit and AppKit when working
 with colors in a multi-platform context.
 */
public typealias ColorRepresentable = NSColor
#endif

#if canImport(UIKit)
import class UIKit.UIColor

/**
 This typealias helps bridging UIKit and AppKit when working
 with colors in a multi-platform context.
 */
public typealias ColorRepresentable = UIColor
#endif
