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
 This context can be used to present any `Alert`, as well as
 anything that implements`AlertPresentable`.
 
 `AlertPresentable` can be implemented by any enum, class or
 struct that can provide an `alert` to the context. It means
 that you can implement custom alerts in many different ways
 and present all of them the same way, using this context.
 
 To use this context within your view, create an instance of
 it then call any of the `present(_ alert: AlertPresentable)`
 or `present(_ alert: Alert)` to present alerts. To bind the
 alert to views, use the `alert` modifier as you normally do:
 
 ```swift
 .alert(isPresented: $alertContext.isActive, content: alertContext.alert)
 ```
 */
public class AlertContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    
    public private(set) var alertView: Alert? {
        didSet { isActive = alertView != nil }
    }
    
    public func alert() -> Alert {
        alertView ?? Alert(title: Text(""))
    }
    
    public func present(_ alert: Alert) {
        alertView = alert
    }
    
    public func present(_ alert: AlertPresentable) {
        alertView = alert.alert
    }
}
