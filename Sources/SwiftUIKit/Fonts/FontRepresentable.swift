//
//  FontRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import AppKit.NSFont

/**
 This typealias helps bridging UIKit and AppKit when working
 with fonts in a multi-platform context.
 */
public typealias FontRepresentable = NSFont
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIFont

/**
 This typealias helps bridging UIKit and AppKit when working
 with fonts in a multi-platform context.
 */
public typealias FontRepresentable = UIFont
#endif
