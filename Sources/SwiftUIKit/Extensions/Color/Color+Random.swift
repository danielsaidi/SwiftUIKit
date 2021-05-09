//
//  Color+Random.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-17.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Color {
    
    static func random() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1))
    }
}
