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
     Present a toast over the view, using a custom `content`
     view for a certain `duration` (by default `2` seconds).
     
     You can use `style` to apply a style to the toast view.
     It's `.none` by default, which means that no style will
     be applied to the toast view.
     */
    func toast<Content: View>(
        isActive: Binding<Bool>,
        content: () -> Content,
        duration seconds: TimeInterval = 2,
        style: ToastStyle = .none) -> some View {
        if isActive.wrappedValue { deactivate(isActive, afterDuration: seconds) }
        let opacity = isActive.wrappedValue ? 1.0 : 0.0
        return overlay(content()
            .toastStyle(style)
            .opacity(opacity))
    }
    
    /**
     Present a toast over the view, using a custom `content`
     view for a certain `duration` (by default `2` seconds).
     
     You can use `style` to apply a style to the toast view.
     It's `.none` by default, which means that no style will
     be applied to the toast view.     
     */
    func toast(
        context: ToastContext,
        duration seconds: TimeInterval = 2,
        style: ToastStyle = .none) -> some View {
        toast(isActive: context.isActiveBinding,
              content: context.toast,
              duration: seconds,
              style: style)
    }
    
    /**
     Apply a certain toast style to the view.
     */
    func toastStyle(_ style: ToastStyle) -> some View {
        self.padding(style.backgroundPadding)
            .background(style.background)
            .cornerRadius(style.cornerRadius)
            .shadow(style.shadowStyle)
    }
}

private extension View {
    
    func deactivate(
        _ isActive: Binding<Bool>,
        afterDuration seconds: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            withAnimation { isActive.wrappedValue = false }
        }
    }
}
