//
//  Color+ClearInteractable.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Color {
 
    @available(*, deprecated, message: "Use contentShape or something else instead, to make an entire view tappable.")
    static var clearInteractable = Color.white.opacity(0.001)
}
