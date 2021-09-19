//
//  Color+Random.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-17.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Color {
    
    /**
     Generate a random color.
     */
    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}
