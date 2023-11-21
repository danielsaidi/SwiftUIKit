//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present `SwiftUI` `Alert`s.
 
 To work with strong types, you can create an enum where all
 cases return an `Alert`, then present that alert.
 
 To use this class, just create a `@StateObject` instance in
 your presenting view and bind the context to that view:
 
 ```swift
 @StateObject var context = AlertContext()
 
 view.alert(context: context)
 
 context.present(Alert(title: "Hello, world!"))
 // ...or if an `AppAlert` enum implements `AlertProvider`:
 context.present(AppAlert.generalWarning)
 ```

 You can now use the contexts functions to present any alert.
 */
public class AlertContext: PresentationContext<Alert> {
    
    public func present(_ alert: @autoclosure @escaping () -> Alert) {
        presentContent(alert())
    }
}
