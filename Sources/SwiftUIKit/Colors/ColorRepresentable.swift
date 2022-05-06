//
//  ColorRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import AppKit.NSColor

/**
 This typealias helps bridging UIKit and AppKit when working
 with colors in a multi-platform context.
 */
public typealias ColorRepresentable = NSColor
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIColor

/**
 This typealias helps bridging UIKit and AppKit when working
 with colors in a multi-platform context.
 */
public typealias ColorRepresentable = UIColor
#endif
