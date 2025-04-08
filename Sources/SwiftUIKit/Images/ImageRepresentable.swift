//
//  ImageRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
import class UIKit.UIImage

/**
 This typealias helps bridging UIKit and AppKit when working
 with images in a multi-platform context.
 */
public typealias ImageRepresentable = UIImage
#elseif canImport(AppKit)
import class AppKit.NSImage

/**
 This typealias helps bridging UIKit and AppKit when working
 with images in a multi-platform context.
 */
public typealias ImageRepresentable = NSImage
#endif

public extension Image {
    
    /// Create an image from a certain ``ImageRepresentable``.
    init(image: ImageRepresentable) {
        #if canImport(UIKit)
        self.init(uiImage: image)
        #elseif canImport(AppKit)
        self.init(nsImage: image)
        #endif
    }
}
