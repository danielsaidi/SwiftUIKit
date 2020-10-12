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
 should be able to show alerts. Then bind the context to the
 view using the `alert` modifier. You can now present alerts
 by calling any `present` function on the context:
 
 ```swift
 @ObservedObject var context = AlertContext()
 
 view.alert(context: context)
 
 context.present(Alert(title: "Hello, world!"))
 // ...or if an `AppAlert` enum implements `AlertProvider`:
 context.present(AppAlert.generalWarning)
 ```
 
 The `context`-specific `alert` modifier is a convenient way
 to present alerts with the `AlertContext`, but you can also
 use the native modifiers if you want or need to.
 
 `IMPORTANT` `@ObservedObject` most often works great, but I
 have had problems with it in apps that target iOS 14, where
 alerts either don't appear or immediately closes. Replacing
 `@ObservedObject` with `@State` has solved the problem, but
 it is not consistent. My advice is to try `@ObservedObject`
 first and only replace it with `@State` if it doesn't work.
 */
public class AlertContext: PresentationContext<Alert> {
    
    public override func content() -> Alert {
        contentView ?? Alert(title: Text(""))
    }
    
    public func present(_ provider: AlertProvider) {
        contentView = provider.alert
    }
}
