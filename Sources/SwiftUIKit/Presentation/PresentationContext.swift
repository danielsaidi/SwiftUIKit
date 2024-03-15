//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

/**
 This class is shared by presentation-specific contexts, and
 can be used to present different views with one context.
 
 To use the context, first create an observed instance, then
 bind it to a view using custom view modifiers. You can also
 set up a global context and pass it into the view hierarchy
 as an environment object.
 */
open class PresentationContext<Content>: ObservableObject {
    
    public init() {}
    
    @Published
    public var isActive = false
    
    @Published
    public internal(set) var content: (() -> Content)? {
        didSet { isActive = content != nil }
    }
    
    public var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
        
    public func dismiss() {
        DispatchQueue.main.async {
            self.isActive = false
        }
    }
    
    public func presentContent(_ content: @autoclosure @escaping () -> Content) {
        DispatchQueue.main.async {
            self.content = content
        }
    }
}
