//
//  View+Toast.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-02-20.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /**
     Present a centered toast over the view, using a custom
     `text` and `background`.
     */
    func toast<Background: View>(
        isActive: Binding<Bool>,
        text: String,
        background: Background,
        style: ToastStyle = .standard,
        duration: TimeInterval = 2) -> some View {
        toast(
            isActive: isActive,
            content: Text(text).multilineTextAlignment(.center),
            background: background,
            style: style,
            duration: duration
        )
    }
    
    /**
     Present a centered toast over the view, using a custom
     `content` view and `background`.
     */
    func toast<Content: View, Background: View>(
        isActive: Binding<Bool>,
        content: Content,
        background: Background,
        style: ToastStyle = .standard,
        duration: TimeInterval = 2) -> some View {
        Toast(
            isActive: isActive,
            content: content,
            background: background,
            style: style,
            duration: duration,
            presenter: { self }
        )
    }
}
