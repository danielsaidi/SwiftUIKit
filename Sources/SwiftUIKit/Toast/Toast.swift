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
 to the user, and will hide itself after a custom `duration`.
 
 Toasts can for instance present a `Text` over a `Color`, an
 `Image` over an `Image`, or use even more complex views.
 
 When a toast is presented, it wraps itself and a `presenter`
 within a `ZStack` and centers itself over the presenter. It
 has a fade in animation, stays for a custom `duration` then
 fades out.
 
 The easiest way to add a `Toast` to a `View`, is to use the
 `toast(...)` `View` extensions.
 */
public struct Toast<Presenter: View, Content: View, Background: View>: View {

    @Binding var isPresented: Bool
    
    public let content: Content
    public let background: Background
    public let cornerRadius: CGFloat
    public let shadowStyle: ShadowStyle
    public let duration: TimeInterval
    public let presenter: () -> Presenter
    
    public var body: some View {
        if isPresented { hide(after: duration) }
        return ZStack(alignment: .center) {
            presenter()
            content
                .padding()
                .background(background)
                .cornerRadius(cornerRadius)
                .shadow(shadowStyle)
                .opacity(isPresented ? 1 : 0)
        }
    }
}

private extension Toast {
    
    func hide(after seconds: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            withAnimation { self.isPresented = false }
        }
    }
}
