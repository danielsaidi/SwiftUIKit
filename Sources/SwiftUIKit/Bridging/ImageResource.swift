//
//  NSImage+ImageResource.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-07-25.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import Cocoa

/**
 This typealias makes it easy to use `NSImage` and `UIImage`
 types interchangeably.
 */
public typealias ImageResource = NSImage
#endif


#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

/**
 This typealias makes it easy to use `NSImage` and `UIImage`
 types interchangeably.
 */
public typealias ImageResource = UIImage
#endif
