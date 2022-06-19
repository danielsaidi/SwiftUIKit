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
@available(*, deprecated, message: "Toast is deprecated. Use the new https://github.com/danielsaidi/SystemNotification library instead.")
public struct ToastStyle {
    
    public init<Background: View>(
        background: Background,
        backgroundPadding: CGFloat,
        cornerRadius: CGFloat,
        shadowStyle: ViewShadowStyle) {
        self.background = background.any()
        self.backgroundPadding = backgroundPadding
        self.cornerRadius = cornerRadius
        self.shadowStyle = shadowStyle
    }
    
    public let background: AnyView
    public let backgroundPadding: CGFloat
    public let cornerRadius: CGFloat
    public let shadowStyle: ViewShadowStyle
}

@available(*, deprecated, message: "Toast is deprecated. Use the new https://github.com/danielsaidi/SystemNotification library instead.")
public extension ToastStyle {
    
    /**
     This style does not apply anything and can be used when
     a style is required, but none is desired.
     */
    static var none: ToastStyle {
        ToastStyle(
            background: Color.clear,
            backgroundPadding: 0,
            cornerRadius: 0,
            shadowStyle: .none
        )
    }
    
    /**
     This is the standard toast style that will be used when
     no explicit style is specified.
     */
    static var standard: ToastStyle {
        ToastStyle(
            background: Color.primary.colorInvert(),
            backgroundPadding: 10,
            cornerRadius: 10,
            shadowStyle: .standardToast
        )
    }
}
