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
 toast overlay over any view.
 
 To use the context, first create an observed instance, then
 bind it to a view using the `toast` modifier, then call the
 context's `present` function to present a toast:
 
 ```swift
 @ObservedObject var context = ToastContext()
 
 view.toast(context: context)   // or, for more flexibility:
 view.toast(isPresented: $context.isActive, content: context.toast)
 
 context.present(Text("Hello, world!").background(Color.white))
 ```
 
 The context-specific `toast` modifier is more conveinent if
 you use contexts, but the binding/content-specific one is a
 bit more flexible and can be used in other scenarios.
 
 The `toast` modifier also lets you specify a `duration` and
 a `style` as well.
 
 You can also use the `ToastProvider` protocol, to present a
 toast for basically anything, e.g. an enum with cases, that
 each returns a specific toast. View the demo for more info.
 */
public class ToastContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    
    public var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
    
    public private(set) var toastView: AnyView? {
        didSet { isActive = toastView != nil }
    }
    
    public func present(_ provider: ToastProvider) {
        toastView = provider.toast
    }
    
    public func present<Toast: View>(_ toast: Toast) {
        toastView = toast.any()
    }
    
    public func toast() -> AnyView {
        toastView?.any() ?? EmptyView().any()
    }
}
