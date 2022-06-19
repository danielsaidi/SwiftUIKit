//
//  ImageRenderer+Scale.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if compiler(>=5.7)
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public extension ImageRenderer {

    /**
     Create an image renderer for a certain content view and
     a certain scale.

     - Parameters:
       - content: The view to snapshot.
       - scale: The scale at which to render the image.
     */
    @MainActor
    convenience init(content: Content, scale: CGFloat) {
        self.init(content: content)
        self.scale = scale
    }

    #if os(iOS) || os(macOS) || os(tvOS)
    /**
     Create an image renderer for a certain content view and
     using the scale of the current screen.

     - Parameters:
       - content: The view to snapshot.
     */
    @MainActor
    convenience init(contentWithScreenScale content: Content) {
        #if os(iOS) || os(tvOS)
        let scale = UIScreen.main.scale
        #elseif os(macOS)
        let scale = NSScreen.main?.backingScaleFactor ?? 2
        #endif

        self.init(content: content, scale: scale)
    }
    #endif
}
#endif
