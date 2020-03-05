//
//  View+Toast.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-02-20.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

private var standardCornerRadius: CGFloat { 10 }
private var standardDuration: TimeInterval { 2 }

extension View {

    /**
     Shows a vertically and horizontally centered toast over
     the view, with custom `content` and `background` views.
     
     For instance, you can have a `Text` view over a `Color`
     background, an `Image` over a background `Image`, or an
     even more complex view hierarchy.
     */
    func toast<Content: View, Background: View>(
        isPresented: Binding<Bool>,
        text: String,
        backgroundColor: Color? = nil,
        cornerRadius: CGFloat = standardCornerRadius,
        shadowStyle: ShadowStyle = .standardToast,
        duration: TimeInterval = standardDuration) -> some View {
        Toast(
            isPresented: isPresented,
            content: Text(text),
            background: backgroundColor,
            cornerRadius: cornerRadius,
            shadowStyle: shadowStyle,
            duration: duration,
            presenter: { self })
    }
    
    /**
     Shows a vertically and horizontally centered toast over
     the view, with custom `content` and `background` views.
     
     For instance, you can have a `Text` view over a `Color`
     background, an `Image` over a background `Image`, or an
     even more complex view hierarchy.
     */
    func toast<Content: View, Background: View>(
        isPresented: Binding<Bool>,
        content: Content,
        background: Background? = nil,
        cornerRadius: CGFloat = standardCornerRadius,
        shadowStyle: ShadowStyle = .standardToast,
        duration: TimeInterval = standardDuration) -> some View {
        Toast(
            isPresented: isPresented,
            content: content,
            background: background,
            cornerRadius: cornerRadius,
            shadowStyle: shadowStyle,
            duration: duration,
            presenter: { self })
    }
}
