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
 implements ``ToastProvider``.
 
 For instance, you can create an enum where all cases return
 a view and have it implement ``ToastProvider``.
 
 To use this class, create a `@StateObject` instance in your
 presenting view, then bind the context to the view with the
 context-specific modifier.
 
 You can now use the `present` functions to present a toast:
 
 ```swift
 @StateObject var context = ToastContext()
 
 view.toast(context: context)
 
 context.present(Text("Hello, world!").background(Color.white))
 // ...or if an `AppToast` enum implements `ToastProvider`:
 context.present(AppToast.generalWarning)
 ```
 
 The `toast` modifier also lets you specify a `duration` and
 a toast `style`, which determines what the toast looks like.
 */
@available(*, deprecated, message: "Toast is deprecated. Use the new https://github.com/danielsaidi/SystemNotification library instead.")
public class ToastContext: PresentationContext<AnyView> {
    
    public func present<Toast: View>(_ toast: @autoclosure @escaping () -> Toast) {
        presentContent(toast().any())
    }
    
    public func present(_ provider: ToastProvider) {
        present(provider.toast)
    }
}
