//
//  Label+Init.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-10.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension Label where Icon == Image, Title == Text {
    
    /**
     Create a label with a string and an image.
     
     This may be easier to use than the multi-closure init.
     */
    init(_ text: String, image: Image) {
        self.init(title: { Text(text) }, icon: { image })
    }
}
