//
//  Font+FontRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-11.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Font {

    /**
     Get a dynamic version of the provided font, that scales
     with dynamic type.
     */
    static func dynamic(_ font: FontRepresentable) -> Font {
        .custom(font.fontName, size: font.pointSize)
    }

    /**
     Get a fixed version of the provided platform font, that
     doesn't scale with dynamic type.
     */
    static func fixed(_ font: FontRepresentable) -> Font {
        Font(font)
    }
}
