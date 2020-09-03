//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

/**
 This class is shared by many presentation-specific contexts,
 like `AlertContext`, `SheetContext` and `ToastContext`. The
 context can be used to manage a generic view as well as its
 presentation state.
 
 To use the context, first create an observed instance, then
 bind it to a presentation-specific view modifier that takes
 an `isPresented` binding and a `content` vuew builder, then
 call the context's `present` function to present the view.
 
 For instance, using the `AlertContext` involves these steps:
 
 ```swift
 @ObservedObject var context = AlertContext()
 
 view.alert(context: context)
 
 context.present(Alert(title: "Hello, world!"))
 ```
 
 Have a look at more specific contexts for more information.
 */
public class PresentationContext<Content>: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    
    public var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
    
    open func content() -> Content { contentView! }
    
    public internal(set) var contentView: Content? {
        didSet { isActive = contentView != nil }
    }
    
    public func present(_ content: Content) {
        contentView = content
    }
}
