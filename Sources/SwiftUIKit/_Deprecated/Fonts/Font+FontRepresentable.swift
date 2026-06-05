//
//  Font+FontRepresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-11.
//  Copyright © 2022-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to FontKit")
public extension Font {

    static func dynamic(_ font: FontRepresentable) -> Font {
        .custom(font.fontName, size: font.pointSize)
    }

    static func fixed(_ font: FontRepresentable) -> Font {
        .init(font)
    }
}
