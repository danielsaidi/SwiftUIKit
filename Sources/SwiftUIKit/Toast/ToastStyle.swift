//
//  ToastStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public struct ToastStyle {
    
    public var cornerRadius: CGFloat
    public var shadowStyle: ShadowStyle
}

public extension ToastStyle {
    
    static var standard: ToastStyle {
        ToastStyle(
            cornerRadius: 10,
            shadowStyle: .standardToast
        )
    }
}
