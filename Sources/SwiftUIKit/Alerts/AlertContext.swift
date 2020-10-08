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
 implements the `AlertProvider` protocol (e.g. an enum where
 each case returns a specific alert).
 
 To use the context, first create a state instance then bind
 it to a view with the `alert` modifier. You can now present
 alerts by calling any `present` function on the context:
 
 ```swift
 @State var context = AlertContext()
 
 view.alert(context: context)
 
 context.present(Alert(title: "Hello, world!"))
 // ...or if an `AppAlert` enum implements `AlertProvider`:
 context.present(AppAlert.generalWarning)
 ```
 
 The context-specific `alert` modifier is more conveinent if
 you use contexts, but the binding/content-specific one is a
 bit more flexible and can be used in other scenarios.
 */
public class AlertContext: PresentationContext<Alert> {
    
    public override func content() -> Alert {
        contentView ?? Alert(title: Text(""))
    }
    
    public func present(_ provider: AlertProvider) {
        contentView = provider.alert
    }
}
