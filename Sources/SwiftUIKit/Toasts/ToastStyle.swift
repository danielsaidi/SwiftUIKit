//
//  ToastStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This style can be used when presenting a toast over a view,
 to apply a custom style to the toast.
 */
public struct ToastStyle {
    
    public var cornerRadius: CGFloat
    public var shadowStyle: ShadowStyle
}

public extension ToastStyle {
    
    /**
     This is the standard toast style that will be used when
     no explicit style is specified.
     */
    static var standard: ToastStyle {
        ToastStyle(
            cornerRadius: 10,
            shadowStyle: .standardToast
        )
    }
}
