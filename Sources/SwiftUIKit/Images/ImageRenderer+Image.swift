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
     Render the provided view as an image.
     */
    @MainActor
    var image: ImageRepresentable? {
        #if os(macOS)
        return nsImage
        #else
        return uiImage
        #endif
    }
}
#endif
