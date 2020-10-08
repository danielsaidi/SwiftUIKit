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
 
 To use the context, first create a state instance then bind
 it to a view with the `toast` modifier. You can now present
 toasts by calling any `present` function on the context:
 
 ```swift
 @State var context = ToastContext()
 
 view.toast(context: context)
 
 context.present(Text("Hello, world!").background(Color.white))
 // ...or if an `AppToast` enum implements `ToastProvider`:
 context.present(AppToast.generalWarning)
 ```
 
 The `toast` modifier also lets you specify a `duration` and
 a `style` as well. 
 
 The context-specific `toast` modifier is more convenient if
 you use contexts, but the binding/content-specific one is a
 bit more flexible and can be used in other scenarios.
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
