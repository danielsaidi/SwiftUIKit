//
//  ShadowStyle+Toast.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension ShadowStyle {
    
    static var standardToast: ShadowStyle {
        ShadowStyle(
            color: Color.black.opacity(0.3),
            radius: 5,
            x: 0,
            y: 0
        )
    }
}
