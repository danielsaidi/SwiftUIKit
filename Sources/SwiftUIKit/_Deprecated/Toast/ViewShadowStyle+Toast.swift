//
//  ShadowStyle+Toast.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension ViewShadowStyle {
    
    @available(*, deprecated, message: "Toast is deprecated. Use the new https://github.com/danielsaidi/SystemNotification library instead.")
    static var standardToast: ViewShadowStyle {
        ViewShadowStyle(
            color: Color.black.opacity(0.3),
            radius: 5,
            x: 0,
            y: 0
        )
    }
}
