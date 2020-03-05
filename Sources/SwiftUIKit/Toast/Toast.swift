//
//  Toast.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 `Toast` is a view with a custom `content` and `background`,
 that is intended to be briefly presented to notify the user
 about something.
 
 When it's presented, it wraps itself and the `presenter` in
 a `ZStack` and centers itself over the presenter. It uses a
 fade in animation, stays for a custom `duration` then fades
 out again.
 
 The easiest way to add a `Toast` to a `View`, is to use the
 `toast(...)` `View` extensions.
 */
struct Toast<Presenter: View, Content: View, Background: View>: View {

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
