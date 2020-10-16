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
 every case returns a specific alert).
 
 To use the context, first create an instance in a view that
 should be able to show alerts, then bind the context to the
 view using the `alert` modifier. You can now present alerts
 by calling any `present` function on the context:
 
 ```swift
 @StateObject var context = AlertContext()
 
 view.alert(context: context)
 
 context.present(Alert(title: "Hello, world!"))
 // ...or if an `AppAlert` enum implements `AlertProvider`:
 context.present(AppAlert.generalWarning)
 ```
 
 You can also use the native alert modifier if you want/need.
 
 `NOTE` In SwiftUI 1, you must use `@ObservedObject` instead
 of `@StateObject`, but then there can be glitches may cause
 the presentation state to cancel. `@StateObject` fixes this.
 */
public class AlertContext: PresentationContext<Alert> {
    
    public override func content() -> Alert {
        contentView ?? Alert(title: Text(""))
    }
    
    public func present(_ provider: AlertProvider) {
        contentView = provider.alert
    }
}
