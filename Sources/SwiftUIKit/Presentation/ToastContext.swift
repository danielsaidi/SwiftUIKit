//
//  ToastContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present any `SwiftUI` view as a
 toast overlay. You can present plain views or anything that
 implements the `ToastProvider` protocol (e.g. a custom enum
 where each case returns a specific toast).
 
 To use this class, create a `@StateObject` instance in your
 presenting view, then bind the context to the view with the
 context-specific modifier. You can now use `present` on the
 context to present toasts:
 
 ```swift
 @StateObject var context = ToastContext()
 
 view.toast(context: context)
 
 context.present(Text("Hello, world!").background(Color.white))
 // ...or if an `AppToast` enum implements `ToastProvider`:
 context.present(AppToast.generalWarning)
 ```
 
 The `toast` modifier also lets you specify a `duration` and
 a toast `style`, which determines what the toast looks like.
 
 `NOTE` In SwiftUI 1, you must use `@ObservedObject` instead
 of `@StateObject`, but this can cause presentation glitches.
 */
public class ToastContext: PresentationContext<AnyView> {
    
    public func present<Toast: View>(_ toast: @autoclosure @escaping () -> Toast) {
        presentContent(toast().any())
    }
    
    public func present(_ provider: ToastProvider) {
        present(provider.toast)
    }
}
