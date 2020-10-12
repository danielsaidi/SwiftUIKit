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
 
 To use the context, first create an instance in a view that
 should be able to show toasts. Then bind the context to the
 view using the `toast` modifier. You can now present toasts
 by calling any `present` function on the context:
 
 ```swift
 @ObservedObject var context = ToastContext()
 
 view.toast(context: context)
 
 context.present(Text("Hello, world!").background(Color.white))
 // ...or if an `AppToast` enum implements `ToastProvider`:
 context.present(AppToast.generalWarning)
 ```
 
 The `toast` modifier also lets you specify a `duration` and
 a toast `style`.
 
 The `context`-specific `toast` modifier is a convenient way
 to present toasts with the `ToastContext`, but you can also
 use the native modifiers if you want or need to.
 
 `IMPORTANT` `@ObservedObject` most often works great, but I
 have had problems with it in apps that target iOS 14, where
 toasts either don't appear or immediately closes. Replacing
 `@ObservedObject` with `@State` has solved the problem, but
 it is not consistent. My advice is to try `@ObservedObject`
 first and only replace it with `@State` if it doesn't work.
 */
public class ToastContext: PresentationContext<AnyView> {
    
    public override func content() -> AnyView {
        contentView ?? EmptyView().any()
    }
    
    public func present<Toast: View>(_ toast: Toast) {
        present(toast.any())
    }
    
    public func present(_ provider: ToastProvider) {
        contentView = provider.toast
    }
}
