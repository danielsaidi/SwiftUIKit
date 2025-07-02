//
//  ImageRepresentable+Data.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-27.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension ImageRepresentable {
    
    /// Get resized and compressed JPG data from the image.
    ///
    /// - Parameters:
    ///   - width: The width of the new image, by default `1000`.
    ///   - quality: The compression quality, by default `0.8`.
    func jpegData(
        resizedToWidth width: CGFloat = 1000,
        withCompressionQuality quality: CGFloat = 0.8
    ) -> Data? {
        let resized = self.resized(toWidth: width)
        let image = resized ?? self
        return image.jpegData(compressionQuality: quality)
    }
}

#if os(macOS)
import AppKit
import Cocoa
import CoreGraphics

public extension ImageRepresentable {

    /// Get the image's core graphics image representation.
    var cgImage: CGImage? {
        cgImage(forProposedRect: nil, context: nil, hints: nil)
    }

    /// Get the image's JPEG data representation.
    func jpegData(compressionQuality: CGFloat) -> Data? {
        guard let image = cgImage else { return nil }
        let bitmap = NSBitmapImageRep(cgImage: image)
        return bitmap.representation(using: .jpeg, properties: [.compressionFactor: compressionQuality])
    }
}
#endif
