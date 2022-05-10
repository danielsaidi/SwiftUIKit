//
//  ImageRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import class AppKit.NSImage

/**
 This typealias helps bridging UIKit and AppKit when working
 with images in a multi-platform context.
 */
public typealias ImageRepresentable = NSImage
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
import class UIKit.UIImage

/**
 This typealias helps bridging UIKit and AppKit when working
 with images in a multi-platform context.
 */
public typealias ImageRepresentable = UIImage
#endif
