//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present `SwiftUI` `Alert`s. You
 can either present plain `Alert` instances or anything that
 implements ``AlertProvider``.
 
 For instance, you can create an enum where all cases return
 an `Alert` and have it implement ``AlertProvider``.
 
 To use this class, just create a `@StateObject` instance in
 your presenting view then bind the context to the view with
 the context-specific modifier.
 
 You can now use the `present` functions to present alerts:
 
 ```swift
 @StateObject var context = AlertContext()
 
 view.alert(context: context)
 
 context.present(Alert(title: "Hello, world!"))
 // ...or if an `AppAlert` enum implements `AlertProvider`:
 context.present(AppAlert.generalWarning)
 ```
 */
public class AlertContext: PresentationContext<Alert> {
    
    public func present(_ alert: @autoclosure @escaping () -> Alert) {
        presentContent(alert())
    }
    
    public func present(_ provider: AlertProvider) {
        present(provider.alert)
    }
}
