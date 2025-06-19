//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This context can be used to present alerts.
///
/// To use this class, just create a `@StateObject` instance
/// in your presenting view and bind the context to the view:
///
/// ```swift
/// extension Alert {
///     static let customAlert = Alert(title: "Hello, world!")
/// }
///
/// struct MyView: View {
///
///     @StateObject var context = AlertContext()
///     var body: some View {
///         Button("Show alert") {
///             context.present(.customAlert)
///         }
///         .alert(context)
///     }
/// }
/// ```
///
/// This view modifier will also inject the provided context
/// as an environment object into the view hierarchy, to let
/// other views in the same hierarchy reuse the same context.
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public class AlertContext: PresentationContext<Alert> {

    @MainActor
    public func present(
        _ alert: @autoclosure @escaping () -> Alert
    ) {
        presentContent(alert())
    }
}

public extension View {
    
    @available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
    func alert(_ context: AlertContext) -> some View {
        alert(
            isPresented: context.isActiveBinding,
            content: context.content ?? { Alert(title: Text("")) }
        )
        .environmentObject(context)
    }
}

/**
 This key can be used to keep track of the currently focused
 context within a multi-window app.

 To apply it to a view, just use the `focusedValue` modifier
 with your context instance:

 ```swift
 .focusedValue(\.fullscreenCoverContext, context)
 ```

 To access the focus value, e.g. in a menu command, just use
 the `@FocusedValue` property wrapper:

 ```swift
 @FocusedValue(\.fullscreenCoverContext)
 var fullscreenCoverContext: FullscreenCoverContext?
 ```
 */
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public struct AlertContextFocusedValueKey: FocusedValueKey {

    public typealias Value = AlertContext
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public extension FocusedValues {

    var alertContext: AlertContextFocusedValueKey.Value? {
        get { self[AlertContextFocusedValueKey.self] }
        set { self[AlertContextFocusedValueKey.self] = newValue }
    }
}
