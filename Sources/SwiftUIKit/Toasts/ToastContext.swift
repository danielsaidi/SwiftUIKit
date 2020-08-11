//
//  ToastContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present a toast over a view.
 
 To use this context within your view, create an instance of
 it then call `present(_ text: String)` to show a plain text
 toast, or call `present<Content: View>(_ content: Content)`
 to present a custom view as a toast.
 
 To bind the toast to a view, just use the `toast` modifier:
 
 ```swift
 .toast(isPresented: $context.isActive, content: sheetContext.sheet, background: ...)
 ```
 
 Note that the context only manages the toast content, since
 the background, style and everything else can be set when a
 toast is bound to the view.
 */
public class ToastContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    @Published public var content = EmptyView().any()
    
    public func present(_ text: String) {
        present(Text(text).multilineTextAlignment(.center))
    }
    
    public func present<Content: View>(_ content: Content) {
        self.content = content.any()
        self.isActive = true
    }
}
