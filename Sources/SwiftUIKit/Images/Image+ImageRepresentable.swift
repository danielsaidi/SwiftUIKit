//
//  Image+ImageRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Image {
    
    /**
     Create an image from a certain ``ImageRepresentable``.
     */
    init(image: ImageRepresentable) {
        #if os(iOS) || os(watchOS) || os(tvOS)
        self.init(uiImage: image)
        #elseif os(macOS)
        self.init(nsImage: image)
        #endif
    }
}
