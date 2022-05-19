//
//  NSImage+Data.swift
//  SwiftUI
//
//  Created by Daniel Saidi on 2021-07-25.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import Cocoa

public extension NSImage {
    
    /**
     Get the image's core graphics image representation.
     */
    var cgImage: CGImage? {
        var rect = CGRect(origin: .zero, size: size)
        return cgImage(forProposedRect: &rect, context: nil, hints: nil)
    }
    
    /**
     Get the image's JPEG data representation.
     */
    func jpegData(compressionQuality: CGFloat) -> Data? {
        guard let image = self.cgImage(forProposedRect: nil, context: nil, hints: nil) else { return nil }
        let bitmap = NSBitmapImageRep(cgImage: image)
        return bitmap.representation(using: .jpeg, properties: [.compressionFactor: compressionQuality])
    }
}
#endif
