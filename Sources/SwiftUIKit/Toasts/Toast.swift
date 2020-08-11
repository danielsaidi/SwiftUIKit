//
//  Toast.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 A `Toast` is a brief overlay view with custom `content` and
 `background`. It is intended to briefly present information
 to the user then hide itself after a custom `duration`.
 
 The easiest and preferred way to add a `Toast` to a `View`,
 is to use the `toast(...)` `View` extensions.
 
 When a toast is presented, it wraps itself within a `ZStack`
 and centers itself over the target `presenter` which is the
 view that presents the toast. It then fades in using a fade
 animation, stays for a custom `duration` then fades out.
 */
public struct Toast<Presenter: View, Content: View, Background: View>: View {

    @Binding var isActive: Bool
    
    public let content: Content
    public let background: Background
    public let style: ToastStyle
    public let duration: TimeInterval
    public let presenter: () -> Presenter
    
    public var body: some View {
        if isActive { hide(after: duration) }
        return ZStack(alignment: .center) {
            presenter()
            content
                .padding()
                .background(background)
                .cornerRadius(style.cornerRadius)
                .shadow(style.shadowStyle)
                .opacity(isActive ? 1 : 0)
        }
    }
}

private extension Toast {
    
    func hide(after seconds: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            withAnimation { self.isActive = false }
        }
    }
}
