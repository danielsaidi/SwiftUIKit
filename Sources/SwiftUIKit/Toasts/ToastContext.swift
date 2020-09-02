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
 
 view.sheet(isPresented: $context.isActive, content: context.content)
 
 context.present(Text("Hello, world!"))
 ```
 
 Note that the context only manages the toast content, since
 the background, style and everything else can be set when a
 toast is bound to the view.
 */
public class ToastContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    @Published public var toast = EmptyView().any()
    
    public func present(_ text: String) {
        present(Text(text).multilineTextAlignment(.center))
    }
    
    public func present<Toast: View>(_ toast: Toast) {
        self.toast = toast.any()
        self.isActive = true
    }
}
