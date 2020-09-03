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
 This context can be used to present `SwiftUI` `Alert`s.
 
 To use the context, first create an observed instance, then
 bind it to your view using a regular `sheet` modifier, then
 call the context's `present` function to present an alert:
 
 ```swift
 @ObservedObject var context = AlertContext()
 
 view.alert(context: context)   // or, for more flexibility:
 view.alert(isPresented: $context.isActive, content: context.alert)
 
 context.present(Alert(title: "Hello, world!")
 ```
 
 The context-specific `alert` modifier is more conveinent if
 you use contexts, but the binding/content-specific one is a
 bit more flexible and can be used in other scenarios.
 
 You can also use the `AlertProvider` protocol to present an
 alert for basically anything, e.g. an enum with cases, that
 each returns a specific alert. View the demo for more info.
 */
public class AlertContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    
    public var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
    
    public private(set) var alertView: Alert? {
        didSet { isActive = alertView != nil }
    }
    
    public func alert() -> Alert {
        alertView ?? Alert(title: Text(""))
    }
    
    public func present(_ alert: Alert) {
        alertView = alert
    }
    
    public func present(_ alert: AlertProvider) {
        alertView = alert.alert
    }
}
