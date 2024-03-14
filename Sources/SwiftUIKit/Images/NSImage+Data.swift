//
//  NSImage+Data.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-07-25.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import AppKit
import Cocoa
import CoreGraphics

public extension NSImage {
    
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
