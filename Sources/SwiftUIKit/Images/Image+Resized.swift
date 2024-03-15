//
//  Image+Resized.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-08-17.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Image {

    /// Resize the image with a certain content mode.
    func resized(to mode: ContentMode) -> some View {
        self.resizable()
            .aspectRatio(contentMode: mode)
    }
}
